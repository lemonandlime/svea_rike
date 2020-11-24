//
//  ContentView.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import SwiftUI
    
struct ContentView: View {
    
    @ObservedObject var game: Game
    
    init() {
        self.game = GameEngine.createGame(playerNames: ["Kalle", "Tore", "Martin", "David"])
    }
    
    var body: some View {
        VStack {
            Text("Regent \(game.regent.display) (\(game.era.display))")
            Text(game.turn.specialCondition.display)
            
            Text(game.turn.currentPlayer.name)
            Text(game.turn.currentPlayerTurn.stage.display)
            Spacer()
            
            if game.turn.currentPlayerTurn.stage == .drawingCard {
                Button("Dra Kort") {
                    game.turn.currentPlayerTurn.eventCard = .krigetsVindar
                }
            }
            
            if game.turn.playerQueue.first?.1.stage == .selectingSpecialization {
                HStack {
                    Button("KULTUR & VETENSKAP") {
                        game.turn.currentPlayerTurn.specialization = .scienceAndCulture
                    }
                    
                    Button("JORDBRUK") {
                        game.turn.currentPlayerTurn.specialization = .farming
                    }
                    
                    Button("HANDEL") {
                        game.turn.currentPlayerTurn.specialization = .trade
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
