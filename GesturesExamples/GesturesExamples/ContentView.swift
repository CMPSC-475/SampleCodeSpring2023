//
//  ContentView.swift
//  GesturesExamples
//
//  Created by Nader Alfares on 2/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var longCount = 0
    @State var offset = CGSize.zero
    @State var scale = 1.0
    @State var angle = Angle.zero
    var body: some View {
        
        let dragGest = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { value in
                offset = CGSize.zero
            }
        
        let magGest = MagnificationGesture()
            .onChanged { value in
                scale = value
                
            }
            .onEnded { value in
                scale = 1.0
            }
        
        let rotGest = RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
            .onEnded { _ in
                self.angle = Angle.zero
            }
        
        let magRotGest = SimultaneousGesture(magGest, rotGest)
        
        return VStack {
            Text("Tap Count: \(count)")
            RedBox()
                .onTapGesture(count: 3) {
                    count += 1
                }
            Text("Long Press Count: \(longCount)")
            RedBox()
                .onLongPressGesture {
                    longCount += 1
                }
            RedBox()
                .offset(offset)
                .gesture(dragGest)
            RedBox()
                .scaleEffect(scale)
                .rotationEffect(angle)
                .gesture(magRotGest)
            
                
            
        }
        .frame(height: 500)
    }
}

struct RedBox : View {
    var size : CGFloat = 50
    var body : some View {
        Rectangle()
            .fill(.red)
            .frame(width: size, height:size)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
