//
//  BubbleView.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import SwiftUI

struct BubbleView: View {
    @EnvironmentObject var maanger : Manager
    @Binding var bubble : Bubble
    @State private var offset = CGSize.zero
    var body: some View {
        
        let resize = MagnificationGesture()
            .onChanged { change in
                bubble.changeSize(by: change)
            }
        
        let move = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { value in
                bubble.move(by: value.translation.size)
                offset = CGSize.zero
            }
        let movePlusResize = SimultaneousGesture(resize, move)
        Circle()
            .offset(offset)
            .fill(Color(bubble.color))
            .frame(width: bubble.radius*2, height: bubble.radius*2)
            .position(CGPoint(bubble.position))
            .gesture(movePlusResize)
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(bubble: .constant(Bubble.standard))
            .environmentObject(Manager())
    }
}
