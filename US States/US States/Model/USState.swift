//
//  USState.swift
//  US States
//
//  Created by Nader Alfares on 3/14/23.
//

import Foundation

struct USState : Identifiable, Codable {
    let name : String
    let capital : String
    let info : String
    let admissionYear : Int
    var favorite : Bool
    var visited : Bool
    let images : [String]
    let stateBird : String?
    
    var id : String { name }
    
    enum CodingKeys : String, CodingKey {
        case name = "state"
        case stateBird = "bird"
        case admissionYear = "year"
        case capital, info, images
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        stateBird = try values.decodeIfPresent(String.self, forKey: .stateBird)
        admissionYear = try values.decode(Int.self, forKey: .admissionYear)
        images = try values.decode([String].self, forKey: .images)
        capital = try values.decode(String.self, forKey: .capital)
        info = try values.decode(String.self, forKey: .info)
        favorite = false
        visited = false
    }
}
