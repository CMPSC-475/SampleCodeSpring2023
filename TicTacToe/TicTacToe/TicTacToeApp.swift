//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    @StateObject var manager = GameManager()
    var body: some Scene {
        WindowGroup {
            TicTacToeView()
                .environmentObject(manager)
        }
    }
}
