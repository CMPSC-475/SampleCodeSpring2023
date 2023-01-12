//
//  CheerTextView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/12/23.
//

import SwiftUI

struct CheerTextView: View {
    let title : String
    let isVisible : Bool
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .opacity(isVisible ? 1.0 : 0.0)
        
    }
}

struct CheerTextView_Previews: PreviewProvider {
    static var previews: some View {
        CheerTextView(title: "We Are", isVisible: true)
    }
}
