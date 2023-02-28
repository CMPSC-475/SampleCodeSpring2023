//
//  UIMap.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/28/23.
//

import SwiftUI
import MapKit

struct UIMap: UIViewRepresentable {
    @ObservedObject var manager : MapManager
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.setRegion(manager.region, animated: true)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let annotations = mapView.annotations
        mapView.removeAnnotations(annotations)
        mapView.addAnnotations(manager.places)
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator()
    }
    
    class MapCoordinator : NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let marker = MKAnnotationView(annotation: annotation, reuseIdentifier: "")
            marker.image = UIImage(systemName: "mappin")
            return marker
        }
    
    }
}

//struct UIMap_Previews: PreviewProvider {
//    static var previews: some View {
//        UIMap()
//    }
//}
