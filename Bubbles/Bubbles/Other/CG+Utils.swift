//
//  CGPoint+Point.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import Foundation
import CoreGraphics

extension CGPoint {
    var point : Point {Point(x: Double(self.x), y: Double(self.y))}
    static func -(lhs:CGPoint,rhs:CGPoint) -> CGPoint {
        CGPoint(x: lhs.x-rhs.x, y: lhs.y-rhs.y)
    }
    init(_ p:Point) {
        self.init()
        x = p.x
        y = p.y
    }
}

extension CGSize {
    var size : Size {Size(width: Double(self.width), height: Double(self.height))}
}
