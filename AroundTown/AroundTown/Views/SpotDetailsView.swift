//
//  SpotDetailsView.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import SwiftUI

struct SpotDetailsView: View {
    var title : String = "Foo Bar"
    @State var angle = 90.0
    var repeatingAnimation: Animation {
        Animation
            .easeInOut(duration: 2)
            .repeatForever()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "circle.grid.hex.fill")
                .font(.system(size:80))
                .padding()
                .rotationEffect(.degrees(angle))
                .foregroundColor(.cyan)
            
            Text(title)
                .font(.system(size:30))
        }
        .onAppear {
            withAnimation(self.repeatingAnimation) { self.angle = -90 }
        }
    }
}

struct SpotDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SpotDetailsView()
    }
}
