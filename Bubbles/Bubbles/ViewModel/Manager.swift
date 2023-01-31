//
//  Manager.swift
//  Bubbles
//
//  Created by Nader Alfares on 1/30/23.
//

import Foundation
import CoreGraphics

class Manager : ObservableObject {
    @Published var bubbles : [Bubble] = [Bubble]()
    var storageManager : StorageManager

    
    init() {
        let _storageManager = StorageManager()
        bubbles = _storageManager.bubbles
        storageManager = _storageManager
        
    }
    //MARK: - Intents
    // add a new bubble (result of tapping on main view)
    func addBubble(at location:CGPoint) {
        //TODO: add a new bubble at location
    }
    
    func delete(_ b:Bubble) {
        //TODO: delete bubble
    }
    
    func bringToFront(_ b:Bubble) {
        //TODO: send bubble to the front
    }
    
    func sendToBack(_ b:Bubble) {
        //TODO: send bubble to the back
    }
    
    //MARK: Persistant
    func save() {
        storageManager.save(bubbles: bubbles)
    }
}


