//
//  DroppedPin.swift
//  AroundTown
//
//  Created by Nader Alfares on 3/2/23.
//

import Foundation
import MapKit

class DroppedPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    init(coord: CLLocationCoordinate2D) {
        coordinate = coord
    }
}
