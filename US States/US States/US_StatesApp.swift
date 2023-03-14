//
//  US_StatesApp.swift
//  US States
//
//  Created by Nader Alfares on 3/14/23.
//

import SwiftUI

@main
struct US_StatesApp: App {
    @StateObject var manager = StatesManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
        }
    }
}
