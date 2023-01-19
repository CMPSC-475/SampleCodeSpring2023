//
//  CheerButton.swift
//  WeAre
//
//  Created by Nader Alfares on 1/12/23.
//

import SwiftUI

struct CheerButton: View {
    @EnvironmentObject var cheerManager : CheerManager
    var action : () -> Void
    var body: some View {
        Button(action: action) {
            Text("Cheer")
        }
        .buttonStyle(.borderedProminent)
        .cornerRadius(10)
        Text(cheerManager.cheerText)
    }
}

struct CheerButton_Previews: PreviewProvider {
    static var previews: some View {
        CheerButton(action: {})
            .environmentObject(CheerManager())
    }
}
