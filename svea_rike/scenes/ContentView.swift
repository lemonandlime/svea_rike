//
//  ContentView.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    var cancellable = Set<AnyCancellable>()
    var playerTurnObserver: AnyCancellable?
    var turnFinishedObserver: AnyCancellable?

    var turnObserver: AnyCancellable?
    
    @ObservedObject var game: Game
    
    @Published var currentPlayerTurn: PlayerTurn
    @Published var currentTurn: Turn
    @Published var currentTurnFinished = false
    
    init(game: Game) {
        self.game = game
        currentTurn = game.turn
        currentPlayerTurn = game.turn.currentPlayerTurn
        
        turnObserver =
            game.$turn
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .sink { turn in
                self.currentTurn = turn
                self.observeCurrentTurn(turn)
            }
        
    }
    
    func observeCurrentTurn(_ turn: Turn) {
        playerTurnObserver?.cancel()
        turnFinishedObserver?.cancel()
        
        playerTurnObserver =
            turn.$currentPlayerTurn
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .assign(to: \.currentPlayerTurn, on: self)

        turnFinishedObserver =
            turn.$finished
            .receive(on: RunLoop.main)
            .assign(to: \.currentTurnFinished, on: self)
        
        
        
        
    }
    
    func startNewTurn() {
        GameEngine.nextTurn(game: &game)
    }
    
    deinit {
        cancellable.forEach { $0.cancel() }
    }
}

struct ContentView: View {
    
    @ObservedObject var vm: ViewModel

    init() {
        let game = GameEngine.createGame(playerNames: ["Kalle"])//, "Tore", "Martin", "David"])
        vm = .init(game: game)
    }
    
    var body: some View {
        ZStack {
            
            Image("board")
            .resizable()
            .ignoresSafeArea(.all, edges: .all)
                .aspectRatio(contentMode: ContentMode.fit)
            
            VStack(alignment: .leading, spacing: 15) {
                
                RegentLineView(turn: vm.currentTurn)
                    .frame(height: 40)
                    .padding(.horizontal, 60)
                    .padding(.bottom, 50)
                
                Spacer()
                
                if vm.currentTurnFinished {
                    Button("Starta nästa regentstid", action: vm.startNewTurn)
                }
                
                PlayerTurnView(turn: vm.currentPlayerTurn)
                
            }.padding()
        }
       
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
