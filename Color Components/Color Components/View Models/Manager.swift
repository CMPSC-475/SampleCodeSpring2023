//
//  Manager.swift
//  CC
//
//  Created by Hannan, John Joseph on 8/29/22.
//

import Foundation

class Manager : ObservableObject {
    @Published var components : [ColorComponent] = []
    @Published var preferences =  Preferences()
    
    //MARK: - Intents

    
    func addColor() {
        let range = 0...255
        let red = Double(Int.random(in: range))/255.0
        let green = Double(Int.random(in: range))/255.0
        let blue = Double(Int.random(in: range))/255.0
        let component = ColorComponent(red: red, green: green, blue:    blue)
        components.append(component)
    }
    
    func clear() {
        components.removeAll()
    }
    
    func delete() {
        if components.count > 0 {
        components.removeLast()
        }
    }
    
    func invert() {
        let newComponents = components.map { c in
            c.invert
        }
        components = newComponents
    }
}


