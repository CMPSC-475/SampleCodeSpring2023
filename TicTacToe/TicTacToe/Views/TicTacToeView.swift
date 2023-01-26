//
//  TicTacToeView.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import SwiftUI

struct TicTacToeView: View {
    @EnvironmentObject var manager : GameManager
    @State var showPreferences : Bool = false
    var body: some View {
        VStack {
            ZStack{
                ForEach(manager.ticTacToeGame) { p in
                    CellView(symbol: p.symbol)
                        .offset(manager.getOffset(for: p.id)!)
                        .onTapGesture {
                            manager.mark(at: p.id)
                            manager.checkGame()
                        }
                    
                }
                Grid(columns: 3, rows: 3)
                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    .frame(width: 300, height: 300)
            }
            
            Button {
                showPreferences = true
            } label: {
                Image(systemName: "pencil.circle")
            }

        }
        .sheet(isPresented: $manager.showSheet) {
            manager.resetGame()
        } content: {
            EndGameView()
        }
        .sheet(isPresented: $showPreferences) {
            PreferencesView(preferences: $manager.preferences)
        }

    }
}

struct CellView : View {
    @EnvironmentObject var manager : GameManager
    var symbol : GamePeice.GamePeiceSymbols
    var body : some View {
        switch symbol {
        case .x:
            XShapeView(color: manager.preferences.xColor)
        case .o:
            OShapeView(color: manager.preferences.oColor)
        case .none:
            Rectangle()
                .frame(width: 20, height: 20)
        }
                
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
            .environmentObject(GameManager())
    }
}
