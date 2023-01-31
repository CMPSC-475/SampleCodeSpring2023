//
//  StorageManager.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/31/23.
//

import Foundation


class StorageManager {
    let filename = "bubbles"
    var bubbles : [Bubble] = [Bubble]()
    
    init() {
        
        let documentsUrl = URL.documentsDirectory.appending(component: filename + ".json")
        let exists = FileManager.default.fileExists(atPath: documentsUrl.path())
        
        if exists {
            do {
                let data = try Data(contentsOf: documentsUrl)
                let decoder = JSONDecoder()
                bubbles = try decoder.decode([Bubble].self, from: data)
            } catch {
                bubbles = []
                print(error)
            }
            return
        }
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: "json")
        
        guard url != nil else {
            bubbles = []
            return
        }
        do {
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            bubbles = try decoder.decode([Bubble].self, from: data)
        } catch {
            bubbles = []
            print(error)
        }
    
    }
    
    func save(bubbles : [Bubble]) {
        do {
            let encoder = JSONEncoder()
            let url = URL.documentsDirectory.appending(component: filename + ".json")
            let data = try encoder.encode(bubbles)
            try data.write(to: url)
        } catch {
            print(error)
        }
        
        
    }
    
    
}
