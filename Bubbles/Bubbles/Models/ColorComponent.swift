//
//  ColorComponent.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import Foundation

struct ColorComponent : Hashable, Identifiable, Equatable, Codable {
    var red : Double
    var green : Double
    var blue : Double
    var opacity : Double = 1.0
    var id  : Self { self } //= UUID()
    static let standard  = ColorComponent(red: 0.6, green: 0.4, blue: 0.3)
}

extension ColorComponent {
    var invert : ColorComponent { ColorComponent(red: 1.0-red, green: 1.0-green, blue: 1.0-blue)}
}
