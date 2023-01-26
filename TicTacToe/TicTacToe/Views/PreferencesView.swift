//
//  PreferencesView.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import SwiftUI

struct PreferencesView: View {
    @Binding var preferences : Preferences
    var body: some View {
        Form {
            Section(header: Text("X Color")) {
                Picker("X Color", selection: $preferences.xColor) {
                    ForEach(Preferences.colorOptions, id:\.self) { c in
                        Text(c.description.capitalized).tag(c)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section(header: Text("O Color")) {
                Picker("O Color", selection: $preferences.oColor) {
                    ForEach(Preferences.colorOptions, id:\.self) { c in
                        Text(c.description.capitalized).tag(c)
                    }
                }
            }
            
        }
    }
}

//struct PreferencesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreferencesView()
//    }
//}
