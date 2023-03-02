//
//  LocationModel.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import Foundation
import MapKit
import CoreLocation

struct Coord {
    var latitude : Double
    var longitude : Double
}

struct LocationModel {
    let centerCoord = Coord(latitude: 40.7964685139719, longitude: -77.8628317618596)
    let favorites : [Spot] =
        [Spot(coord: Coord(latitude: 40.79550030, longitude: -77.85900170), title: "Cheese Shoppe") ,
         Spot(coord: Coord(latitude: +40.79414797, longitude: -77.86152899), title: "The Corner Room")]
    let downtownCoordinates = [(40.791831951313,-77.865203974557),
                                    (40.800364570711,-77.853778542571),
                                    (40.799476294037,-77.8525124806654),
                                    (40.7908968034537,-77.8638607142546)].map {(a,b) in CLLocationCoordinate2D(latitude: a, longitude: b)}
    
}
