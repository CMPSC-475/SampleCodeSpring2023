//
//  Arc.swift
//  ShapesOfThings
//
//  Created by Nader Alfares on 2/7/23.
//

import Foundation
import SwiftUI

// Defines a arc using a Bezier quad curve between two horizontally aligned points and through a control point midway between them and offset along the Y-axis
struct Arc : Shape {
    var offset : CGFloat
    
    var animatableData: CGFloat {
        get {offset}
        set {offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let radius = min(rect.maxX/2, rect.maxY/2)
        
        path.move(to: CGPoint(x: rect.midX-radius, y: rect.midY))

        path.addQuadCurve(to: CGPoint(x: rect.midX+radius, y: rect.midY), control: CGPoint(x:rect.midX, y:rect.midY-offset))

        return path
    }
}
