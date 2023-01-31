//
//  BubblesApp.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import SwiftUI

@main
struct BubblesApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var manager = Manager()
    var body: some Scene {
        WindowGroup {
            BubblesView()
                .environmentObject(manager)
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .background:
                        manager.save()
                    case .active:
                        break
                    case .inactive:
                        break
                    @unknown default:
                        assert(false, "Uknown scene Phase")
                    }
                }
        }
    }
}
