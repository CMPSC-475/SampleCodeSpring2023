//
//  SpotDetailsView.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import SwiftUI

struct PlaceDetailsView: View {
    var place : Place?
    
    private var title : String {
        guard place != nil else {return "unknown"}
        return place!.name
    }
    
    private var isFavorite : Bool {
        guard place != nil else {return false}
        return place!.favorite
    }
    
    @State var angle = 90.0
    var repeatingAnimation: Animation {
        Animation
            .easeInOut(duration: 2)
            .repeatForever()
    }
    
    var body: some View {
        
        return VStack {
            Image(systemName: isFavorite ? "star.fill" : "circle.grid.hex.fill")
                .font(.system(size:80))
                .padding()
                .rotationEffect(.degrees(angle))
                .foregroundColor(isFavorite ? .yellow : .cyan)
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
        PlaceDetailsView(place: Place.standard)
    }
}
