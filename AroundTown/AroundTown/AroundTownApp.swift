//
//  AroundTownApp.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import SwiftUI

@main
struct AroundTownApp: App {
    @StateObject var manager = MapManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
        }
    }
}
