//
//  FavoriteBubbleView.swift
//  Bubbles
//
//  Created by Nader Alfares on 2/8/23.
//

import SwiftUI

struct FavoriteBubbleView: View {
    @Binding var bubble : Bubble
    
    var body: some View {
        Circle()
            .fill(Color(bubble.color))
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
