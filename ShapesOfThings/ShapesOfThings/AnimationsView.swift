//
//  AnimationsView.swift
//  ShapesOfThings
//
//  Created by Nader Alfares on 2/7/23.
//

import SwiftUI

struct AnimationsView: View {
    
    @State var upScale : Bool = false
    @State var roundRect = 0.0
    @State var squareColor : Color = .green
    
    @State var depth = 100.0
    @State var ratio = 1.0
    @State var angle = 45.0
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(upScale ? .red : .blue)
                .opacity(1.0)
                .frame(width:100)
                .scaleEffect(upScale ? 0.01 : 1.0)
                .animation(.default.repeatForever(autoreverses: true), value: upScale)
                .onAppear {
                    upScale = true
                }

            Rectangle()
                .fill(squareColor)
                .frame(width:100,height:100)
                .cornerRadius(roundRect)
                .animation(.default.repeatForever(autoreverses: true), value:  roundRect)
                .onAppear {
                        roundRect = 50.0
                        squareColor = .red
                }

            Diamond()
                .fill(.orange)
                .aspectRatio(ratio, contentMode: .fit)
                .animation(.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 1).repeatForever(autoreverses: true), value: ratio)
                .onAppear {
                    ratio = (ratio == 1.0) ? 3.0 : 1.0
                }
                



            Arc(offset: depth)
                .stroke(style: .init(lineWidth: 10.0, lineCap: .round, lineJoin: .round, miterLimit: 1.0, dash: [], dashPhase: 0))
                .animation(.linear(duration: 2.0).repeatForever(autoreverses: true), value: depth)
                .onAppear {
                    depth = -100.0
                }

            RoundedRectangle(cornerRadius: 10)
                .fill(.purple)
                .aspectRatio(0.20, contentMode: .fit)
                .rotationEffect(Angle(degrees: angle), anchor: UnitPoint(x: 0.5, y: 1))
                .frame(height: 100)
                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: angle)
            
                .onAppear {
                    angle = -45
                    
                }
        }
    }
}

struct AnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsView()
    }
}
