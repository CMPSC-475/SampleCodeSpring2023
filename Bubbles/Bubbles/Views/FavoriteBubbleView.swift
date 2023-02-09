//
//  FavoriteBubbleView.swift
//  Bubbles
//
//  Created by Nader Alfares on 2/8/23.
//

import SwiftUI

struct FavoriteBubbleView: View {
    @Binding var bubble : Bubble
    @State var scale = 1.5
    
    var favoriteOverlay : some View {
        Image(systemName: "heart.fill" )
            .foregroundColor(Color(bubble.color.invert))
            .shadow(radius: 50)
            .scaleEffect(scale)
            .animation(.easeInOut.repeatForever(autoreverses: true), value: scale)
            .onAppear {
                scale = 2.0
            }
            .opacity(bubble.favorite ? 1.0 : 0.0)
    }
    
    var body: some View {
        Circle()
            .fill(Color(bubble.color))
            .overlay(favoriteOverlay)
            .frame(width: bubble.radius*2, height: bubble.radius*2)
            .position(CGPoint(bubble.position))
    }
    
    
}

struct FavoriteBubbleView_Previews: PreviewProvider {

    static var previews: some View {
        var bubble : Bubble {
            var b = Bubble.standard
            b.favorite = true
            return b
        }
        return FavoriteBubbleView(bubble: .constant(bubble))
    }
}
