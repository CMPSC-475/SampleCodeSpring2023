//
//  MapManager+GeoCode.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/20/23.
//

import Foundation
import MapKit


extension MapManager {
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
    
    func revGeoCodeUserLocation() {
        guard let userRecentLocation = userRecentLocation else {return}
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(userRecentLocation) { placemarks, error in
            guard error == nil else {return}
            if let placemark = placemarks?.first {
                let mark = MKPlacemark(placemark: placemark)
                self.usersLocationDescription = mark.title
                self.showingAlert = true
            }
        }
    }
}
