//
//  LocationModel.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import Foundation

struct Coord {
    var latitude : Double
    var longitude : Double
}

struct LocationModel {
    let centerCoord = Coord(latitude: 40.7964685139719, longitude: -77.8628317618596)
    let favorites : [Spot] =
        [Spot(coord: Coord(latitude: 40.79550030, longitude: -77.85900170), title: "Cheese Shoppe") ,
         Spot(coord: Coord(latitude: +40.79414797, longitude: -77.86152899), title: "The Corner Room")]
    
}
