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
    @State var selectedSpot : Spot?
    var body: some View {
        Map(coordinateRegion: $manager.region, annotationItems: manager.places, annotationContent: annotationFor(place:))
    }
}

struct DowntownMapView_Previews: PreviewProvider {
    static var previews: some View {
        DowntownMapView()
            .ignoresSafeArea()
            .environmentObject(MapManager())
    }
}
