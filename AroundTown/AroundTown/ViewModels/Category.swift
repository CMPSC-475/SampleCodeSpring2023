//
//  Category.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import Foundation

enum Category : String, CaseIterable {
    case airport, bar, coffee, dining, gas = "Gas Station"
    case grocery, hospital, hotel, laundry, library, movies, parking
    case pizza, shopping
    
    var imageName : String {  // SF Symbol names
          switch self {
          case .airport: return "airplane.circle"
          case .bar: return "wineglass"
          case .coffee: return "cup.and.saucer.fill"
          case .dining: return "fork.knife.circle"
          case .gas: return "fuelpump.circle"
          case .grocery: return "takeoutbag.and.cup.and.straw"
          case .hospital: return "cross.circle"
          case .hotel: return "bed.double.circle"
          case .laundry: return "washer"
          case .library: return "books.vertical.circle"
          case .movies: return "popcorn.circle"
          case .parking: return "car.circle"
          case .pizza: return "chart.pie"
          case .shopping: return "bag.circle"
          }
      }
}
