//
//  Color_ComponentsApp.swift
//  Color Components
//
//  Created by Hannan, John Joseph on 9/5/22.
//

import SwiftUI

@main
struct Color_ComponentsApp: App {
    @StateObject var manager = Manager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
        }
    }
}
