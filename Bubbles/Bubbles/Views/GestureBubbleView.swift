//
//  GestureBubbleView.swift
//  Bubbles
//
//  Created by Nader Alfares on 2/8/23.
//

import SwiftUI

struct GestureBubbleView: View {
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
        FavoriteBubbleView(bubble: $bubble)
            .offset(offset)
            .gesture(movePlusResize)
    }
}

struct GestureBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        GestureBubbleView(bubble: .constant(Bubble.standard))
    }
}
