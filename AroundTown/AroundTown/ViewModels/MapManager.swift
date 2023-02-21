//
//  MapManager.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import Foundation
import MapKit
import SwiftUI

class MapManager  : NSObject, ObservableObject {
    @Published var locationModel : LocationModel

    @Published var region : MKCoordinateRegion
    let span = 0.01
    
    
    // Selectors
    @Published var selectedCategory : Category? {
        didSet {
            if let selectedCategory = selectedCategory {
                performSearch(on: selectedCategory)
            }
        }
    }
    @Published var selectedRestaurant : Restaurant? {
        didSet {
            if let selectedRestaurant = selectedRestaurant {
                geoCode(for: selectedRestaurant)
            }
        }
    }
    @Published var selectedPlace : Place?
    
    // presenters
    @Published var showConfirmation = false
    @Published var showSheet = false
    
    @Published var places = [Place]()
    
    let locationManager : CLLocationManager
    
    override init(){
        let _locationModel = LocationModel()
        region = MKCoordinateRegion(center: _locationModel.centerCoord.coordCL2D, span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span))
        locationModel = _locationModel
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = .leastNonzeroMagnitude
    }
    
    //MARK: Helper Methods
    func imageNameFor(category:Category?) -> String {
        guard let category = category else {
            return ""
        }
        return category.rawValue.capitalized
    }
    
    func toggleFavorite(place: Place) {
        guard let index = places.firstIndex(of: place) else { return }
        self.places[index].favorite.toggle()
    }
    
    func scaleFactorFor(place : Place) -> Double {
        if let selectedPlace = selectedPlace {
            return place.id == selectedPlace.id ? 3.0 : 1.0
        }
        return 1.0
    }

}

// define extensions here to have support for CoreLocation
extension Spot  {
    var coordinate : CLLocationCoordinate2D {
        self.coord.coordCL2D
    }
}

extension Coord {
    var coordCL2D : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
