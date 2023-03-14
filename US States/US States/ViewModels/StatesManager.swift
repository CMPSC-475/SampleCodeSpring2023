//
//  StatesManager.swift
//  US States
//
//  Created by Nader Alfares on 3/14/23.
//

import Foundation

class StatesManager : ObservableObject {
    
    @Published var theStates : [USState]
    let storageManager : StorageManager<[USState]>
    
    
    init() {
        let filename = "StateData"
        storageManager = StorageManager<[USState]>(filename: filename)
        theStates = storageManager.modelData ?? []
    }
    
}
