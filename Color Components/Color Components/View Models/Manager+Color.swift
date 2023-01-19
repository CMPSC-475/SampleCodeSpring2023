//
//  Manager+Color.swift
//  CC
//
//  Created by Hannan, John Joseph on 8/29/22.
//

import Foundation
import SwiftUI

extension Manager {
    func colorForComponent(_ component:ColorComponent) -> Color {
        let color = Color(red: component.red, green: component.green, blue: component.blue)
        return color
    }
}
