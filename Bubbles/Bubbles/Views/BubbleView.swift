//
//  BubbleView.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import SwiftUI

struct BubbleView: View {
    @EnvironmentObject var manager : Manager
    @Binding var bubble : Bubble

    var body: some View {
        GestureBubbleView(bubble: $bubble)
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(bubble: .constant(Bubble.standard))
            .environmentObject(Manager())
    }
}
