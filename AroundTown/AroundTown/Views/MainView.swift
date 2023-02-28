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
            VStack {
                // DowntownMapView()
                UIMap(manager: manager)
                if manager.route != nil {
                    TabView {
                        ForEach(0..<manager.route!.steps.count, id:\.self) { index in
                            Text(manager.route!.steps[index].instructions)
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(height: 200.0)
                } else if !manager.places.isEmpty {
                    TabbedView(places: manager.places, selectedPlace: $manager.selectedPlace)
                        .frame(height: 200.0)
                }
            }
                .ignoresSafeArea()
                .toolbar {
                    categoriesToolbarItem
                    diningToolbarItem
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            manager.revGeoCodeUserLocation()
                        } label: {
                            Image(systemName: "map")
                        }

                    }
                }
                .sheet(isPresented: $manager.showSheet, content: {
                    PlaceDetailsView(place: manager.selectedPlace)
                })
                .alert(manager.usersLocationDescription ?? "No Info", isPresented: $manager.showingAlert, actions: {})
                .confirmationDialog("spot", isPresented: $manager.showConfirmation, presenting: manager.selectedPlace) { place in
                    Button(place.favorite ? "unfavorite" : "favorite") {
                        manager.toggleFavorite(place: place)
                    }
                    Button("Details") {
                        manager.selectedPlace = place
                        manager.showSheet = true
                    }
                    Button("Directions") {
                        manager.provideDirections(to: place)
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
