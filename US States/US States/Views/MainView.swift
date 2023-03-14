//
//  ContentView.swift
//  US States
//
//  Created by Nader Alfares on 3/14/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var manager : StatesManager
    
    
    var body: some View {
        List {
            ForEach(manager.theStates) { state in
                Text(state.name)
            }
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(StatesManager())
    }
}
