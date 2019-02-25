//
//  ViewController.swift
//  Wordsearch
//
//  Created by Suhaib AlMutawakel on 2/17/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.url(forResource: "capitals", withExtension: "json")!
        let contents = try! Data(contentsOf: path)
        let words = try! JSONDecoder().decode([Word].self, from:
            contents)
        
        let wordSearch = WordSearch()
        wordSearch.words = words
        
        let output = wordSearch.render()
        let url = getDocumentsDirectory().appendingPathComponent("output.pdf")
        
        print(url)
        try? output.write(to: url)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}

