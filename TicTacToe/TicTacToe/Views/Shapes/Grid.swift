//
//  Grid.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import Foundation
import SwiftUI

struct Grid: Shape {
    let columns : Int
    let rows : Int
    func path(in rect: CGRect) -> Path {
        var xDelta : Int {Int(rect.size.width) / columns}
        var yDelta : Int {Int(rect.size.height) / rows}
        var path = Path()
        for i in stride(from: xDelta, to: xDelta*(columns), by: xDelta) {
            path.move(to: CGPoint(x: CGFloat(i), y: 0))
            path.addLine(to: CGPoint(x: CGFloat(i), y: rect.size.height))
        }
        for i in stride(from: yDelta, to: yDelta*(rows), by: yDelta) {
            path.move(to: CGPoint(x: 0, y: CGFloat(i)))
            path.addLine(to: CGPoint(x: rect.size.width, y: CGFloat(i)))
        }
        return path
    }
}
