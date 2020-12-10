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
    
    @ObservedObject var game: Game
    
    @Published var currentPlayerTurn: PlayerTurn
    
    init(game: Game) {
        self.game = game
        
        self.currentPlayerTurn = game.turn.currentPlayerTurn
        
        game.turn.$currentPlayerTurn
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .assign(to: \.currentPlayerTurn, on: self)
            .store(in: &cancellable)
    }
    
    deinit {
        cancellable.forEach { $0.cancel() }
    }
}

struct ContentView: View {
    
    @ObservedObject var vm: ViewModel

    
    init() {
        let game = GameEngine.createGame(playerNames: ["Kalle", "Tore", "Martin", "David"])
        vm = .init(game: game)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            HStack {
                Text("Regent \(vm.game.regent.name) (\(vm.game.era.display))")
                Text(vm.game.turn.specialCondition.display)
            }
        
            
            PlayerTurnView(turn: vm.currentPlayerTurn)
            
        }.padding().frame(maxWidth: 400)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
