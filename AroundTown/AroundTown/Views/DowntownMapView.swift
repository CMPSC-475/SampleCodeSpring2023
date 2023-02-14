//
//  DowntownMapView.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import SwiftUI
import MapKit

struct DowntownMapView: View {
    @EnvironmentObject var manager : MapManager
    @State var showConfirmation = false
    @State var showSheet = false
    @State var selectedSpot : Spot?
    var body: some View {
//        Map(coordinateRegion: $manager.region)
//            .ignoresSafeArea()
        Map(coordinateRegion: $manager.region, annotationItems: manager.locationModel.favorites, annotationContent: menuFor)
            .confirmationDialog("Details", isPresented: $showConfirmation) {
                Button(selectedSpot?.title ?? "Unknown"){}
            }
            .sheet(isPresented: $showSheet) {
                SpotDetailsView(title: selectedSpot?.title ?? "Unknown")
            }
    }
    
    func markerFor(spot : Spot) -> some MapAnnotationProtocol {
        MapMarker(coordinate: spot.coordinate, tint: .red)
    }
    
    func annotationFor(spot: Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Button {
                selectedSpot = spot
                showConfirmation = true
            } label: {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 40))
            }

        }
    }
    
    func menuFor(spot: Spot) -> some MapAnnotationProtocol{
        MapAnnotation(coordinate: spot.coordinate) {
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.red)
                .contextMenu {
                    Text(spot.title!)
                    Button {
                        selectedSpot = spot
                        showSheet = true
                    } label: {
                        Text("Details")
                    }

                }
            
                
                
        }
    }
    
}

struct DowntownMapView_Previews: PreviewProvider {
    static var previews: some View {
        DowntownMapView()
            .environmentObject(MapManager())
    }
}
