//
//  WeAreApp.swift
//  WeAre
//
//  Created by Nader Alfares on 1/12/23.
//

import SwiftUI

@main
struct WeAreApp: App {
    @StateObject var cheerManager = CheerManager()
    var body: some Scene {
        WindowGroup {
            WeAreView()
                .environmentObject(cheerManager)
        }
    }
}
