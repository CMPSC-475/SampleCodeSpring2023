//
//  ContentView.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import SwiftUI

struct BubblesView: View {
    @EnvironmentObject var manager : Manager
    let backgroundColor : Color = Color.gray.opacity(0.5)
    
    var body: some View {
        let addBubbleGest = SpatialTapGesture()
            .onEnded { value in
                manager.addBubble(at: value.location)
            }
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            ForEach($manager.bubbles) { $bubble in
                BubbleView(bubble: $bubble)
            }
        }
        .gesture(addBubbleGest)
    }
}


struct BubblesView_Previews: PreviewProvider {
    static var previews: some View {
        BubblesView()
            .environmentObject(Manager())
    }
}
