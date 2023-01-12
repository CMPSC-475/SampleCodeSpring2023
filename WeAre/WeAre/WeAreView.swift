//
//  ContentView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/12/23.
//

import SwiftUI

struct WeAreView: View {
    @ObservedObject var cheerManager = CheerManager()
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            VStack {
                MascotView(imageName: cheerManager.mascotImageName)
                CheerTextView(title: cheerManager.firstCheerText, isVisible: cheerManager.shouldShowFirstCheer)
                CheerTextView(title: cheerManager.secondCheerText, isVisible: cheerManager.shouldShowSecondCheer)
                CheerButton(action: cheerManager.doACheer)
                
            }
        }
    }
}

struct WeAreView_Previews: PreviewProvider {
    static var previews: some View {
        WeAreView()
    }
}
