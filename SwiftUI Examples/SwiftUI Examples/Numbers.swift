//
//  Numbers.swift
//  SwiftUI Examples
//
//  Created by Nader Alfares on 1/10/23.
//

import SwiftUI

struct Numbers: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(0..<100) { num in
                Text("number \(num)")
            }
        }
    }
}

struct Numbers_Previews: PreviewProvider {
    static var previews: some View {
        Numbers()
    }
}
