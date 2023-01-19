//
//  BlendView.swift
//  Color Components
//
//  Created by Hannan, John Joseph on 9/8/22.
//

import SwiftUI

struct BlendView: View {
    @Binding var components : [ColorComponent]

    var count : Int {components.count}
    let size : CGFloat = 150
    let radius : CGFloat = 50
    let opacity = 0.3
    
    var body: some View {
        ZStack {
            ForEach(0..<count, id:\.self) {i in
                let angle = CGFloat(i)*(2*CGFloat.pi)/CGFloat(count)
                Circle()
                    .fill(colorForComponent(components[i]))
                    .opacity(opacity)
                    .frame(width:size)
                    .offset(x: radius * cos(angle), y: radius * sin(angle))
            }
        }
    }
    
    func colorForComponent(_ component:ColorComponent) -> Color {
        let color = Color(red: component.red, green: component.green, blue: component.blue)
        return color
    }
}

struct BlendView_Previews: PreviewProvider {
    static var previews: some View {
        BlendView(components: .constant([ColorComponent.standard]))
    }
}
