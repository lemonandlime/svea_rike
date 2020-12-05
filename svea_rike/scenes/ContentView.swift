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
        VStack {
            Text("Regent \(vm.game.regent.display) (\(vm.game.era.display))")
            Text(vm.game.turn.specialCondition.display)

            Text(vm.game.turn.currentPlayer.name)
            
            PlayerTurnView(turn: vm.currentPlayerTurn)
            
            
        }.padding()
    }
    
    struct FarmRouteView: View {
        @ObservedObject var currentPlayerTurn: PlayerTurn
        
        var body: some View {
            Group {
                if currentPlayerTurn.stage == .placingMerchant {
                    HStack {
                        ForEach(Country.all, id: \.self) { country in
                            Button(country.display) {
                                currentPlayerTurn.addedMerchant = country
                            }
                        }
                    }
                }
                
                if currentPlayerTurn.stage == .collectingTradeIncome {
                    Button("Inkassera inkomster") {
                        currentPlayerTurn.collectedIncome = 5
                    }
                }
                
                if currentPlayerTurn.stage == .payingTroops {
                    Button("Betala") {
                        currentPlayerTurn.paidTroopSupport = 3
                    }
                }
            }
        }
    }
    
    struct TradeRouteView: View {
        @ObservedObject var currentPlayerTurn: PlayerTurn
        
        var body: some View {
            Group {
                if currentPlayerTurn.stage == .placingMerchant {
                    HStack {
                        ForEach(Country.all, id: \.self) { country in
                            Button(country.display) {
                                currentPlayerTurn.addedMerchant = country
                            }
                        }
                    }
                }
                
                if currentPlayerTurn.stage == .collectingTradeIncome {
                    Button("Inkassera inkomster") {
                        currentPlayerTurn.collectedIncome = 5
                    }
                }
                
                if currentPlayerTurn.stage == .payingTroops {
                    Button("Betala") {
                        currentPlayerTurn.paidTroopSupport = 3
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
