//
//  CheerButton.swift
//  WeAre
//
//  Created by Nader Alfares on 1/12/23.
//

import SwiftUI

struct CheerButton: View {
    var action : () -> Void
    var body: some View {
        Button(action: action) {
            Text("Cheer")
        }
        .buttonStyle(.borderedProminent)
        .cornerRadius(10)
    }
}

struct CheerButton_Previews: PreviewProvider {
    static var previews: some View {
        CheerButton(action: {})
    }
}
