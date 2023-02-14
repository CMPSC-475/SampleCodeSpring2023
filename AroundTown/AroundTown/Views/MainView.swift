//
//  MainView.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var manager : MapManager
    var body: some View {
        NavigationStack {
            DowntownMapView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        SearchButtonView()
                    }
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MapManager())
    }
}
