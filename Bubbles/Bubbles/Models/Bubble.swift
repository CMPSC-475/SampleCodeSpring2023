//
//  Bubble.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import Foundation

struct Size {
    var width: Double
    var height: Double
}

struct Point : Equatable, Codable {
    var x : Double = 0
    var y : Double = 0
}

struct Bubble : Identifiable, Equatable, Codable{
    var color : ColorComponent
    var position : Point
    var radius : Double = 50
    var favorite = false
    var id = UUID()
    
    static let standard = Bubble(color: ColorComponent.standard, position: Point(x: 150 , y: 300), radius: 100)
    
    mutating func move(by size:Size) {
        //TODO: move bubbles position
    }
    
    mutating func changeSize(by d:Double) {
        //TODO: change size of bubble
    }
    
    mutating func toggleFavorite() {
        //TODO: favorite/unfavorite bubble
    }
}
