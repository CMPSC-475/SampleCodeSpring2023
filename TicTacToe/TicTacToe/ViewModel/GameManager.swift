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

class GameManager : ObservableObject {
    @Published var ticTacToeGame = TicTacToeGame()
    @Published var gameState : GameState = .inGame
    
    
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
        //TODO: marking a peice when selected
    }
    
    func checkGame(){
        if let winner = ticTacToeGame.checkWinner() {
            gameState = winner == .x ? .xWin : .oWin
        } else if ticTacToeGame.checkDraw() {
            gameState = .draw
        }
    }
}
