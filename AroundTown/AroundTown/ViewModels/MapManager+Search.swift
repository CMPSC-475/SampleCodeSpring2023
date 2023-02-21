//
//  MapManager+Search.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/20/23.
//

import Foundation
import MapKit

extension MapManager {
    //MARK: Local Search
    func performSearch(on category: Category?) {
        guard let category = category else { return }
        self.places = []
        let request = MKLocalSearch.Request()
        request.region = region
        request.naturalLanguageQuery = category.rawValue
        let search = MKLocalSearch(request: request)
        search.start { resp, error in
            guard error == nil else { return }
            let mapItems = resp!.mapItems
            for item in mapItems {
                let place = Place(mapItem: item, category: category)
                self.places.append(place)
            }
        }
    }
    
}
