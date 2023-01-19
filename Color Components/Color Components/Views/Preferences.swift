//
//  Preferences.swift
//  Color Components
//
//  Created by Hannan, John Joseph on 9/8/22.
//

import Foundation

enum ColorShape : String, Identifiable, CaseIterable {
    case rectangle, circle, capsule
    var id : RawValue { rawValue }
}

struct Preferences {
    var shape: ColorShape = .rectangle
}
