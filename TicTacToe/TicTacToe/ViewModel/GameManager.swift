//
//  GameManager.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import Foundation

import SwiftUI

enum GameState {
    case inGame, xWin, oWin, draw
}

struct Preferences {
    var xColor : Color = .red
    var oColor : Color = .blue
    static let colorOptions : [Color] = [.red, .green, .yellow, .blue]
}

class GameManager : ObservableObject {
    @Published var ticTacToeGame = TicTacToeGame()
    @Published var gameState : GameState = .inGame
    
    @Published var currentTurn = GamePeice.GamePeiceSymbols.x
    @Published var showSheet : Bool = false
    
    @Published var preferences = Preferences()
    
    // used to translate the index of a piece to it's offset on the views
    private let offsetsForID : [Int : CGSize] = [
        0: CGSize(width: -100, height: -100),
        1: CGSize(width: 0, height: -100),
        2: CGSize(width: 100, height:  -100),
        3: CGSize(width: -100, height: 0),
        4: CGSize(width:0, height:0),
        5: CGSize(width:100, height:0),
        6: CGSize(width:-100, height:100),
        7: CGSize(width:0, height:100),
        8: CGSize(width:100, height:100),
    ]
    
    func getOffset(for id: Int) -> CGSize?{
        offsetsForID[id]
    }
    
    func resetGame(){
        ticTacToeGame = TicTacToeGame()
        gameState = .inGame
    }
    
    func mark(at index: Int) {
        if ticTacToeGame[index].symbol == .none {
            ticTacToeGame.mark(at: index, currentTurn)
            currentTurn = currentTurn == .x ? .o : .x
        }
    }
    
    func checkGame(){
        if let winner = ticTacToeGame.checkWinner() {
            gameState = winner == .x ? .xWin : .oWin
            showSheet = true
        } else if ticTacToeGame.checkDraw() {
            gameState = .draw
            showSheet = true
        }
    }
}
