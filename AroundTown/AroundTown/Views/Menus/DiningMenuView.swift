//
//  DiningMenuView.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/15/23.
//

import SwiftUI

struct DiningMenuView: View {
    @Binding var selectedRestaurant : Restaurant?
    var body: some View {
        Menu {
            ForEach(Restaurant.restaurants) { r in
                Button(r.name) {
                    selectedRestaurant = r
                }
            }
        } label: {
            Image(systemName: "fork.knife.circle")
        }
    }
}

struct DiningMenuView_Previews: PreviewProvider {
    static var previews: some View {
        DiningMenuView(selectedRestaurant: .constant(Restaurant.restaurants[0]))
    }
}
