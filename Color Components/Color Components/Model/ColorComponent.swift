//
//  ColorComponent.swift
//  CC
//
//  Created by Hannan, John Joseph on 8/29/22.
//

import Foundation

struct ColorComponent : Identifiable, Equatable {
    var red : Double
    var green : Double
    var blue : Double
    let id = UUID()
    static let standard  = ColorComponent(red: 0.6, green: 0.4, blue: 0.3)
}

extension ColorComponent {
    var invert : ColorComponent { ColorComponent(red: 1.0-red, green: 1.0-green, blue: 1.0-blue)}
}
