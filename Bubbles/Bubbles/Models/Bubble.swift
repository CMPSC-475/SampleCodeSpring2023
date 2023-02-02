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
        position.x = position.x + size.width
        position.y = position.y + size.height
    }
    
    mutating func changeSize(by d:Double) {
        let base : Double = 50
        let min : Double = 0.25
        let max : Double = 3.0
        guard (d > min && d < max) else {return}
        radius = base * d
    }
    
    mutating func toggleFavorite() {
        favorite.toggle()
    }
}
