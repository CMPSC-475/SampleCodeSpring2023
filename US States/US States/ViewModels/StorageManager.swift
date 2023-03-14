//
//  StorageManager.swift
//  US States
//
//  Created by Nader Alfares on 3/14/23.
//

import Foundation

class StorageManager<T:Codable> {
    var modelData : T?
    private let filename : String
    
    init(filename: String) {
        self.filename = filename
        let documentsUrl = URL.documentsDirectory.appending(component: filename + ".json")
        let exists = FileManager.default.fileExists(atPath: documentsUrl.path())
        if exists {
            do {
                let data = try Data(contentsOf: documentsUrl)
                let decoder = JSONDecoder()
                modelData = try decoder.decode(T.self, from: data)
            } catch {
                modelData = nil
                print(error)
            }
            return
        }
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: "json")
        guard url != nil else {
            modelData = nil
            return
        }
        do {
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            modelData = try decoder.decode(T.self, from: data)
        } catch {
            modelData = nil
            print(error)
        }
    
    }
    
    func save(modelData : T) {
        do {
            let encoder = JSONEncoder()
            let url = URL.documentsDirectory.appending(component: filename + ".json")
            let data = try encoder.encode(modelData)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
}
