//
//  ContentView.swift
//  ShapesOfThings
//
//  Created by Nader Alfares on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .fill(.green)
            Rectangle()
                .fill(.yellow)
            Triangle()
                .fill(.red)
            Sector(startAngle: 0, endAngle: CGFloat.pi/2)
                .fill(.blue)
            ColorWheel()
        }
        .padding()
    }
}

//TODO: create a triangle
struct Triangle : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}


//TODO: create a sector
struct Sector : Shape {
    var startAngle : CGFloat
    var endAngle   : CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)/2
        
        let point1 = CGPoint(x: center.x + radius * cos(startAngle), y: center.y + radius * sin(startAngle))
        path.move(to: center)
        path.addLine(to: point1)
        path.addArc(center: center, radius: radius, startAngle: Angle(radians: startAngle), endAngle: Angle(radians: endAngle), clockwise: false)
        path.closeSubpath()
        return path
        
    }
    
    
}

//TODO: create a wheel of colors
struct ColorWheel : View {
    let colors : [Color] = [.red, .yellow, .pink, .green, .blue, .cyan]
    var body : some View {
        ZStack {
            ForEach(0..<colors.count, id:\.self) {i in
                            let slice = CGFloat(2) * CGFloat.pi/CGFloat(colors.count)
                            let startAngle = CGFloat(i) * slice
                            let endAngle = CGFloat(i+1) * slice
                Sector(startAngle: startAngle, endAngle: endAngle)
                    .fill(colors[i])
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
