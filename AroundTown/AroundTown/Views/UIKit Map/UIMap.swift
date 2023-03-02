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
}

//struct UIMap_Previews: PreviewProvider {
//    static var previews: some View {
//        UIMap()
//    }
//}
