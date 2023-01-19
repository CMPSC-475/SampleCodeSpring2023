//
//  ShapeView.swift
//  ColorComponents
//
//  Created by Hannan, John Joseph on 9/4/22.
//

import SwiftUI

struct ShapeView: View {
    @EnvironmentObject var manager : Manager
    let colorShape: ColorShape
    let color : Color
    let isSelected : Bool
    let lineWidth : CGFloat = 3
    var width : CGFloat  {isSelected ? 3 : 0}
    var body: some View {
        switch colorShape {
        case .rectangle:
            Rectangle().fillStroke(color: color, width: width)
        case .circle:
            Circle().fillStroke(color: color, width: width)
        case .capsule:
            Capsule().fillStroke(color: color, width: width)
        }
            
    }
    
}

extension Shape {
    func fillStroke(color:Color, width:CGFloat) -> some View {
        ZStack {
            self.fill(color)
            self.stroke(lineWidth: width)
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView(colorShape:.rectangle, color: .blue, isSelected: true)
    }
}

