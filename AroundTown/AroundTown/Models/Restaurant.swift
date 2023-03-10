//
//  Restaurant.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import Foundation

struct Restaurant : Codable, Identifiable {
    var name : String
    var address : String
    var id : String {name}
    
    static var restaurants = {
        var res : [Restaurant] = []
        let restaurantURL = Bundle.main.url(forResource: "Restaurants", withExtension: "json")!
        do {
            let data = try Data(contentsOf: restaurantURL)
            let decoder = JSONDecoder()
            res = try decoder.decode([Restaurant].self, from: data)
        } catch   {
            print("Error decoding Restaurants: \(error)")
            res = []
        }
        return res
    }()
}
