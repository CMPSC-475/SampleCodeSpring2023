//
//  USState.swift
//  US States
//
//  Created by Nader Alfares on 3/14/23.
//

import Foundation

struct USState : Identifiable {
    let name : String
    let capital : String
    let info : String
    let admissionYear : Int
    var favorite : Bool
    var visited : Bool
    let images : [String]
    let stateBird : String?
    
    var id : String { name }
}
