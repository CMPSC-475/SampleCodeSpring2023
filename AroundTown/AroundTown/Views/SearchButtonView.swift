//
//  SearchButtonView.swift
//  AroundTown
//
//  Created by Nader Alfares on 2/13/23.
//

import SwiftUI

struct SearchButtonView: View {
    var body: some View {
        Menu {
            ForEach(Category.allCases, id:\.self) {category in
                Button(category.rawValue.capitalized) {
                    
                }
            }
        } label: {
            Image(systemName: "magnifyingglass")

        }

        
    }
}

struct SearchButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SearchButtonView()
    }
}
