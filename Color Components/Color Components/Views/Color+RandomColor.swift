//
//  Color+RandomColor.swift
//  CC
//
//  Created by Hannan, John Joseph on 8/29/22.
//

import Foundation
import SwiftUI

extension Color {
    static let randomColor = Color.init(red: Double(Int.random(in: 0...255))/255, green: Double(Int.random(in: 0...255))/255, blue: Double(Int.random(in: 0...255))/255)
}
