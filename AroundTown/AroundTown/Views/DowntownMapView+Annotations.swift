//
//  DowntownMapView+Annotations.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/15/23.
//

import Foundation
import SwiftUI
import MapKit


extension DowntownMapView {
    
    func markerFor(spot : Spot) -> some MapAnnotationProtocol {
        MapMarker(coordinate: spot.coordinate, tint: .red)
    }
    func annotationFor(spot: Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Button {
                selectedSpot = spot
                manager.showConfirmation = true
            } label: {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 40))
            }

        }
    }
    func menuFor(spot: Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.red)
                .contextMenu {
                    Text(spot.title!)
                    Button {
                        selectedSpot = spot
                        manager.showSheet = true
                    } label: {
                        Text("Details")
                    }
                }
        }
    }
    
    func annotationFor(place: Place) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: place.coordinate) {
            Button(action: {
                manager.selectedPlace = place
                manager.showConfirmation = true
            }) {
                Image(systemName: "mappin").renderingMode(.template)
                    .foregroundColor(place.favorite ? .yellow : .blue)
                    .font(.system(size: 40))
            }
        }
    }
    
    
}
