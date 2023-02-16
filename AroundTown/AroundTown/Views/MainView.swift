//
//  MainView.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var manager : MapManager
    var body: some View {
        let categoriesToolbarItem = ToolbarItem(placement: .navigationBarTrailing) {
            SearchButtonView(selectedCategory: $manager.selectedCategory)
        }
        
        let diningToolbarItem = ToolbarItem(placement: .navigationBarLeading){
            DiningMenuView(selectedRestaurant: $manager.selectedRestaurant)
        }
        
        return NavigationStack {
            DowntownMapView()
                .ignoresSafeArea()
                .toolbar {
                    categoriesToolbarItem
                    diningToolbarItem
                }
                .sheet(isPresented: $manager.showSheet, content: {
                    PlaceDetailsView(place: manager.selectedPlace)
                })
                .confirmationDialog("spot", isPresented: $manager.showConfirmation, presenting: manager.selectedPlace) { place in
                    Button(place.favorite ? "unfavorite" : "favorite") {
                        manager.toggleFavorite(place: place)
                    }
                    Button("Details") {
                        manager.selectedPlace = place
                        manager.showSheet = true
                    }
                } message: { place in
                    Text("\(place.title ?? "unknown")")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MapManager())
    }
}
