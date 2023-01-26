//
//  EndGameView.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import SwiftUI

struct EndGameView: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        switch manager.gameState {
        case .xWin:
            Text("Winner is ..")
            XShapeView(color: .red)
        case .oWin:
            Text("Winner is ..")
            OShapeView(color: .blue)
        case .draw:
            Text("It's a draw")
        default:
            Text("Game Ended")
        }
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
            .environmentObject(GameManager())
    }
}
