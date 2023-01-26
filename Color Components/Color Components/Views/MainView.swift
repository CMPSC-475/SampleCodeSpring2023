//
//  MainView.swift
//  Color Components
//
//  Created by Hannan, John Joseph on 9/5/22.
//

import SwiftUI

enum Showing : String, Identifiable, CaseIterable {
    case editor, preferences, blend
    var id: RawValue { rawValue}
}

struct MainView: View {
    @EnvironmentObject var manager : Manager
    @State private var showEditor = false
    @State private var selectedIndex : Int?
    @State private var showing : Showing?
    var body: some View {
        VStack {
            ForEach(0..<manager.components.count, id:\.self) {i in
                Button(action: { selectedIndex = selectedIndex==i ? nil : i}) {
                    ShapeView( colorShape: manager.preferences.shape, color: colorForComponent(manager.components[i]), isSelected: selectedIndex == i )
                }
            }
            
            Spacer()
            HStack {
                ControlButtons(showing: $showing, disableEditButton: selectedIndex==nil)
                
            }
        }
        .padding()
        .sheet(item: $showing) { item in
            switch item {
            case .editor: ComponentEditorView(component: $manager.components[selectedIndex!])
            case .blend: BlendView(components: $manager.components)
            case .preferences: PreferencesView(preferences: $manager.preferences)
                
            }
        }
        //        .sheet(isPresented: $showEditor) {
        //            ComponentEditorView(component: $manager.components[selectedIndex!])
        //        }
        
    }
    
    func colorForComponent(_ component:ColorComponent) -> Color {
        let color = Color(red: component.red, green: component.green, blue: component.blue)
        return color
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
