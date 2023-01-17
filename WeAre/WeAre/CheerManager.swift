//
//  CheerManager.swift
//  WeAre
//
//  Created by Nader Alfares on 1/12/23.
//

import Foundation

class CheerManager : ObservableObject {
    
    // The Model
    let cheers : Cheering = PSUCheer()
    
    
    // State of the APP (AKA Logic)
    enum CheerState {
        case initial, firstRoundFirstCheer, firstRoundSecondCheer, secondRoundFirstCheer, secondRoundSecondCheer
    }
    var cheerState : CheerState = .initial
    
    var mascotImageName : String {
        switch cheerState {
        case .initial:
            return cheers.initialCheer.imageName
        case .firstRoundFirstCheer:
            return cheers.firstRound.firstCheer.imageName
        case .firstRoundSecondCheer:
            return cheers.firstRound.secondCheer.imageName
        case .secondRoundFirstCheer:
            return cheers.secondRound.firstCheer.imageName
        case .secondRoundSecondCheer:
            return cheers.secondRound.secondCheer.imageName
        }
    }
    
    var cheerText : String {
        switch cheerState {
        case .initial:
            return cheers.initialCheer.title
        case .firstRoundFirstCheer:
            return cheers.firstRound.firstCheer.title
        case .firstRoundSecondCheer:
            return cheers.firstRound.secondCheer.title
        case .secondRoundFirstCheer:
            return cheers.secondRound.firstCheer.title
        case .secondRoundSecondCheer:
            return cheers.secondRound.secondCheer.title
        }
    }
        
    var shouldShowFirstCheer : Bool {
        [.firstRoundFirstCheer, .secondRoundFirstCheer].contains(cheerState)
    }
    var shouldShowSecondCheer : Bool  { [.firstRoundSecondCheer, .secondRoundSecondCheer].contains(cheerState) }
    
    
    private var inFirstRound : Bool { cheerCount <= cheers.firstRoundCount*2}
    private var oddCheer : Bool {cheerCount > 0 && cheerCount % 2 == 1}
    
    @Published var cheerCount = 0 {
        didSet {
            if cheerCount == 0 {
                cheerState = .initial
            } else if inFirstRound {
                cheerState = oddCheer ? .firstRoundFirstCheer : .firstRoundSecondCheer
            } else {
                cheerState = oddCheer ? .secondRoundFirstCheer : .secondRoundSecondCheer
                
            }
            
        }
    }

    
    func doACheer() {
        cheerCount = (cheerCount + 1) % cheers.totalCheers
    }
}
