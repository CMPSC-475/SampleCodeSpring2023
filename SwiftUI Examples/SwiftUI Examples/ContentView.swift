//
//  ContentView.swift
//  SwiftUI Examples
//
//  Created by Nader Alfares on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WelcomeView()
    }
}

struct WelcomeView : View {
    var body : some View {
        VStack {
            Image("BeaverStadium")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(alignment: .bottomTrailing ) {
                    Text("Beaver Stadium")
                        .foregroundColor(.white)
                }
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
