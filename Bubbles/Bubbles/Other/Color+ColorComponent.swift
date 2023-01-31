//
//  Color+ColorComponent.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import Foundation
import SwiftUI

extension Color {
    init(_ component : ColorComponent) {
        self.init(red: component.red, green: component.green, blue: component.blue , opacity: component.opacity)
    }
}
