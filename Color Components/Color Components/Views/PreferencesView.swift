//
//  PreferencesView.swift
//  Color Components
//
//  Created by Hannan, John Joseph on 9/8/22.
//

import SwiftUI

struct PreferencesView: View {
    @Binding var preferences : Preferences
    var body: some View {
        Form {
            Section(header: Text("Shapes")) {
                Picker("Shape", selection: $preferences.shape) {
                    ForEach(ColorShape.allCases) {
                        Text($0.rawValue.capitalized).tag($0)
                    }
                } .pickerStyle(.segmented)
            }
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(preferences: .constant(Preferences()))
    }
}
