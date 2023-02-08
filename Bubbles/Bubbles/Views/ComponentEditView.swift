//
//  ComponentEditView.swift
//  Bubbles
//
//  Created by Nader Alfares on 2/8/23.
//
import SwiftUI


struct ComponentEditView: View {
    @Binding var component : ColorComponent

    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Form {
            Section(header: Text("Color")) {
                    Color(red: component.red, green: component.green, blue: component.blue, opacity: component.opacity)

            }
            ComponentSliderSection(label: "Red", value: $component.red)
            ComponentSliderSection(label: "Green", value: $component.green)
            ComponentSliderSection(label: "Blue", value: $component.blue)
            ComponentSliderSection(label: "Opacity", value: $component.opacity)
            
            Button("Dismiss") { dismiss() }
            
        }
        .interactiveDismissDisabled()
    }
}

struct ComponentSliderSection : View {
    var label : String
    @Binding var value : Double
    var body : some View {
        Section {
            HStack {
                
            Text(label)
            Slider(value: $value, in: 0...1, label: {Text(label)}, minimumValueLabel: {Text("0")}, maximumValueLabel: {Text("1")})
            }
        }
    }
}

struct ComponentEditView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentEditView(component:.constant(ColorComponent.standard))
    }
}
