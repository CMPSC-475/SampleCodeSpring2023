//
//  ComponentEditorView.swift
//  Color Components
//
//  Created by Hannan, John Joseph on 9/6/22.
//

import SwiftUI

struct ComponentEditorView: View {
    @Binding var component : ColorComponent
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("Color")) {
                Color(red: component.red, green: component.green, blue: component.blue)
            }
            ComponentSliderSection(label: "Red", value: $component.red)
            ComponentSliderSection(label: "Green", value: $component.green)
            ComponentSliderSection(label: "Blue", value: $component.blue)
            
            Button("Dismiss") {
                dismiss()
            }
            
            
        }
    }
}

struct ComponentSliderSection : View {
    var label: String
    @Binding var value : Double
    var body : some View {
        Section {
            Slider(value: $value, in: 0...1, label: {Text(label)}, minimumValueLabel: {Text("0")}, maximumValueLabel: {Text("1")})
        }
    }
}

struct ComponentEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentEditorView(component: .constant(ColorComponent.standard))
    }
}
