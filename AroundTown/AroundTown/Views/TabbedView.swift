//
//  TabbedView.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/21/23.
//

import SwiftUI

struct TabbedView: View {
    
    let places : [Place]
    @State var selection : Int = 0
    @Binding var selectedPlace : Place?
    var body: some View {
        TabView(selection: $selection) {
            ForEach(places.indices, id:\.self) { index in
                VStack {
                    Text(places[index].title ?? "No Title")
                    Text(places[index].address)
                }.tag(index)
            }
        }
        .tabViewStyle(.page)
        .onChange(of: selection) { newValue in
            selectedPlace = places[selection]
        }
        .onAppear {
            selectedPlace = places[selection]
        }
    }
}

//struct TabbedView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabbedView()
//    }
//}
