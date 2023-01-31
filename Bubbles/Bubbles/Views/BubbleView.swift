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
    var body: some View {
        Circle()
            .fill(Color(bubble.color))
            .frame(width: bubble.radius*2, height: bubble.radius*2)
            .position(CGPoint(bubble.position))
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(bubble: .constant(Bubble.standard))
            .environmentObject(Manager())
    }
}
