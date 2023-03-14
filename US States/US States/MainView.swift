//
//  ContentView.swift
//  US States
//
//  Created by Nader Alfares on 3/14/23.
//

import SwiftUI

struct MainView: View {    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
