//
//  CheerManager.swift
//  WeAre
//
//  Created by Nader Alfares on 1/12/23.
//

import Foundation

class CheerManager : ObservableObject {
    
    var mascotImageName = "Mascot0"
    var firstCheerText = "We Are"
    var secondCheerText = "Penn State"
    
    var shouldShowFirstCheer : Bool { cheerCount % 2 == 1}
    var shouldShowSecondCheer : Bool { cheerCount > 0 && cheerCount % 2 == 0}
    
    @Published var cheerCount = 0
    var totalCount = 7
    
    func doACheer() {
        cheerCount = (cheerCount + 1) % totalCount
    }
}
