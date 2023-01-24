//
//  PiecesShapes.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import Foundation
import SwiftUI

struct XShape : Shape {
    func path(in rect: CGRect) -> Path {
        //TODO: Create X shape
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        return path
    }
}

struct XShapeView : View {
    var color = Color.black
    var body : some View {
        XShape()
            .stroke(color, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .frame(width: 75, height: 75)
    }
}

struct OShape: Shape {
    var innerRadius: CGFloat
    var outerRadius: CGFloat
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var path = Path()
        path.addArc(center: center, radius: innerRadius, startAngle: Angle(radians: 0), endAngle: Angle(radians: 2*CGFloat.pi), clockwise: true)
        path.addArc(center: center, radius: outerRadius, startAngle: Angle(radians: 0), endAngle: Angle(radians: 2*CGFloat.pi), clockwise: true)
        return path
    }
}

struct OShapeView : View {
    var color = Color.black
    var body : some View {
        OShape(innerRadius: 20, outerRadius: 35)
            .fill(color, style: FillStyle(eoFill: true))
            .frame(width: 75, height: 75)
    }
}
