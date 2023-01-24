//
//  TicTacToeView.swift
//  TicTacToe
//
//  Created by Nader Alfares on 1/24/23.
//

import SwiftUI

struct TicTacToeView: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        VStack {
            ZStack{
                //TODO: construct views for the games
                OShape(innerRadius: 20, outerRadius: 35)
                    .fill(.red, style: FillStyle(eoFill: true))
                
                XShapeView()
                    .offset(manager.getOffset(for: 0)!)
                
                Grid(columns: 3, rows: 3)
                    .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    .frame(width: 300, height: 300)
            }
        }
    }
}

struct CellView : View {
    @EnvironmentObject var manager : GameManager
    var symbol : GamePeice.GamePeiceSymbols
    var body : some View {
        switch symbol {
        case .x:
            XShapeView(color: .blue)
        case .o:
            OShapeView(color: .red)
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
