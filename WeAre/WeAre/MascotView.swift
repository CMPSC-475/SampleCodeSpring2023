//
//  MascotView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/12/23.
//

import SwiftUI

struct MascotView: View {
    let imageName : String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct MascotView_Previews: PreviewProvider {
    static var previews: some View {
        MascotView(imageName: "Mascot0")
    }
}
