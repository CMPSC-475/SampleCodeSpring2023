//
//  MapCoordinator.swift
//  AroundTown
//
//  Created by Nader Alfares on 3/1/23.
//

import Foundation
import MapKit

class MapCoordinator : NSObject, MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKAnnotationView(annotation: annotation, reuseIdentifier: "")
        marker.image = UIImage(systemName: "mappin")
        return marker
    }

}
