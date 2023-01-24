//
//  GamePiece.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import Foundation


struct GamePeice : Identifiable {
    enum GamePeiceSymbols : String {
        case x = "X"
        case o = "O"
        case none = "-"
    }
    var symbol : GamePeiceSymbols
    var id : Int
}

typealias TicTacToeGame = [GamePeice]

extension TicTacToeGame {
    init() {
        var _game = Array(repeating: GamePeice(symbol: .none, id: 0), count: 9)
        for (index, _) in _game.enumerated() {
            _game[index].id = index
        }
        self = _game
    }
    
    func checkWinner() -> GamePeice.GamePeiceSymbols? {
        let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        for combo in winningCombinations {
            let first = self[combo[0]].symbol
            let second = self[combo[1]].symbol
            let third = self[combo[2]].symbol
            
            if [first, second, third].contains(.none) {
                continue
            } else if Set([first, second, third]).count < 2 {
                return first
            }
        }
        return nil
    }
    
    func checkDraw() -> Bool {
        if checkWinner() == nil && !self.contains(where: { p in
            p.symbol == .none
        }) {
            return true
        }
        return false
    }

    
    mutating func mark(at index: Int, _ symbol: GamePeice.GamePeiceSymbols) {
        self[index].symbol = self[index].symbol == .none ? symbol : self[index].symbol
    }
}
