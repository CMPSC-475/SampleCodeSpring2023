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
    var storageManager : StorageManager<[Bubble]>
    private var filename = "bubbles"

    
    init() {
        let _storageManager = StorageManager<[Bubble]>(filename: filename)
        bubbles = _storageManager.modelData ?? []
        storageManager = _storageManager
        
    }
    //MARK: - Intents
    // add a new bubble (result of tapping on main view)
    func addBubble(at location:CGPoint) {
        var randomVal : Double {Double(Int.random(in: 0...255))/255}
        
        let point = Point(x: Double(location.x), y: Double(location.y))
        let cc = ColorComponent(red: randomVal, green: randomVal, blue: randomVal)
        let bubble = Bubble(color: cc, position: point)
        bubbles.append(bubble)
    }
    
    func delete(_ b:Bubble) {
        if let i =  bubbles.firstIndex(of: b) {
            bubbles.remove(at: i)
        }
    }
    
    func bringToFront(_ b:Bubble) {
        if let i =  bubbles.firstIndex(of: b) {
            let bubble = bubbles.remove(at: i)
            bubbles.append(bubble)
        }
    }
    
    func sendToBack(_ b:Bubble) {
        if let i =  bubbles.firstIndex(of: b) {
            let bubble = bubbles.remove(at: i)
            bubbles.insert(bubble, at: 0)
        }
    }
    
    //MARK: Persistant
    func save() {
        storageManager.save(modelData: bubbles)
    }
}


