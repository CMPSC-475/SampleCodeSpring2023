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

    @State var showDialog : Bool = false
    var body: some View {
        GestureBubbleView(bubble: $bubble)
            .onTapGesture {
                showDialog = true
            }
            .confirmationDialog("Options", isPresented: $showDialog) {
                Button(bubble.favorite ? "UnFavorite" : "Favorite") {
                    bubble.favorite.toggle()
                }
                Button("Bring to Front") {
                    manager.bringToFront(bubble)
                }
                Button("Send to Back") {
                    manager.sendToBack(bubble)
                }
                Button("Float") {
                    withAnimation {
                        bubble.move(by: Size(width: 0, height: -1000))
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            manager.delete(bubble)
                        }
                    }
                }
                Button("Delete", role: .destructive) {
                    manager.delete(bubble)
                }
                Button("Cancel", role:.cancel) {
                    
                }
            }
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(bubble: .constant(Bubble.standard))
            .environmentObject(Manager())
    }
}
