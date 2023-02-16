//
//  MapManager.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import Foundation
import MapKit
import SwiftUI

class MapManager  : ObservableObject {
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
    
    init(){
        let _locationModel = LocationModel()
        region = MKCoordinateRegion(center: _locationModel.centerCoord.coordCL2D, span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span))
        locationModel = _locationModel
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
    
    //MARK: Local Search
    func performSearch(on category: Category?) {
        guard let category = category else { return }
        self.places = []
        let request = MKLocalSearch.Request()
        request.region = region
        request.naturalLanguageQuery = category.rawValue
        let search = MKLocalSearch(request: request)
        search.start { resp, error in
            guard error == nil else { return }
            let mapItems = resp!.mapItems
            for item in mapItems {
                let place = Place(mapItem: item, category: category)
                self.places.append(place)
            }
        }
    }
    
    //MARK: GeoCoding
    func geoCode(for restaurant : Restaurant) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.address) { placemarks, error in
            guard error == nil else { return }
            if let placemark = placemarks?.first {
                let mapMark = MKPlacemark(placemark: placemark)
                let place = Place(placeMark: mapMark, category: .dining, name: restaurant.name)
                self.places.removeAll()
                self.places.append(place)
                self.region.center = mapMark.coordinate
                self.region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            }
        }
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
