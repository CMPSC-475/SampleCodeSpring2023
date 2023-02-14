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
    
    init(){
        let _locationModel = LocationModel()
        region = MKCoordinateRegion(center: _locationModel.centerCoord.coordCL2D, span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span))
        locationModel = _locationModel
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
