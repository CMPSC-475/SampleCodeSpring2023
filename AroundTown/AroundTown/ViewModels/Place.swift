//
//  Place.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import Foundation
import MapKit

// needs to be a class to conform to MKAnnotation
class Place :  NSObject, Identifiable, MKAnnotation {
    let category : Category?
    var placeMark : MKPlacemark
    var phoneNumber : String
    var url : String
    var customName : String?
    
    var id  = UUID()

    
    static var standard = Place(placeMark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.79550030, longitude: -77.85900170)), category: .coffee)
    
    init(category:Category?, placeMark:MKPlacemark, phoneNumber:String, url:String, customName:String?) {
        self.category = category
        self.placeMark = placeMark
        self.phoneNumber = phoneNumber
        self.url = url
        self.customName = customName
    }

}

// Computed Properties
extension Place {
    var title : String? { self.placeMark.name ?? "" }
    var address : String { get {(self.subThoroughfare ?? "") + " " + (self.thoroughfare ?? "")} }
    var name : String {customName ?? placeMark.name ?? "No Name"}
    var thoroughfare : String? {self.placeMark.thoroughfare}
    var subThoroughfare : String? {self.placeMark.subThoroughfare}
    var coordinate : CLLocationCoordinate2D {self.placeMark.coordinate}
}

// Convenient Init
extension Place {
    convenience init(mapItem:MKMapItem, category:Category?) {
        self.init(category:category, placeMark:mapItem.placemark, phoneNumber:mapItem.phoneNumber ?? "", url:mapItem.url?.description ?? "", customName:"")
    }
    
    convenience init(placeMark:MKPlacemark, category:Category?) {
        self.init(category:category, placeMark:placeMark, phoneNumber: "", url: "", customName:"")
    }
    
    convenience init(placeMark:MKPlacemark, category:Category?, name:String) {
        self.init(placeMark:placeMark, category:category)
        self.customName = name
    }
}
