//
//  RedSquare.swift
//  SwiftUI Examples
//
//  Created by Nader Alfares on 1/10/23.
//

import SwiftUI

struct RedSquare: View {
    var boxColor : Color
    var body: some View {
        Rectangle()
            .foregroundColor(boxColor)
            .frame(width: 50, height: 50)
    }
}

struct RedSquareRow: View {
    var body : some View {
        HStack {
            RedSquare(boxColor: .blue)
            Spacer()
            RedSquare(boxColor: .green)
        }
    }
}

struct RedSquareCorners : View {
    var body : some View {
        VStack {
            RedSquareRow()
            Spacer()
            RedSquareRow()
        }
    }
}



struct RedSquare_Previews: PreviewProvider {
    static var previews: some View {
        RedSquareCorners()
            //.ignoresSafeArea(edges: .top)
    }
}
