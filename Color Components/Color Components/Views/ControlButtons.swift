//
//  ControlButtons.swift
//  CC
//
//  Created by Hannan, John Joseph on 8/29/22.
//

import SwiftUI

struct ControlButtons: View {
    @EnvironmentObject var manager : Manager
    @Binding var showing : Showing?
    var disableEditButton : Bool
    
    var body: some View {
        HStack(spacing:20) {
            Button(action: {manager.addColor()}) {
                Text("Add")
            }
            Button(action:{manager.clear()}) {
                Text("Clear")
            }
            Button(action:{manager.delete()}) {
                Image(systemName: "delete.left")
            }
            Button(action:{manager.invert()}) {
                Image(systemName: "arrow.triangle.swap")
            }
            Button(action:{showing = .blend}) {
                Image(systemName: "circle.hexagongrid.circle")
            }
            Button(action:{showing = .editor}) {
                Image(systemName: "pencil.circle")
            }.disabled(disableEditButton)
            
            Button(action:{showing = .preferences}) {
                Image(systemName: "gear.circle")
            }
            
        }
        .padding()
        .tint(.indigo)
        
        
    }
}

struct ControlButtons_Previews: PreviewProvider {
    static var previews: some View {
        ControlButtons(showing: .constant(nil), disableEditButton: true)
    }
}
