//
//  PlayerTurnView.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-12-05.
//

import SwiftUI

//extension PlayerTurnView {
//    class ViewModel: ObservableObject {
//
//    }
//}

struct PlayerTurnView: View {
    @ObservedObject var turn: PlayerTurn
    
    var body: some View {
        VStack {
            Text(turn.stage.display)
            Spacer()
            
            if turn.stage == .drawingCard {
                Button("Dra Kort") {
                    turn.eventCard = .krigetsVindar
                }
            }
            
            if turn.stage == .selectingSpecialization {
                HStack {
                    Button("KULTUR & VETENSKAP") {
                        turn.specialization = .scienceAndCulture
                    }
                    
                    Button("JORDBRUK") {
                        turn.specialization = .farming
                    }
                    
                    Button("HANDEL") {
                        turn.specialization = .trade
                    }
                }
            }
            
            if turn.specialization == .trade {
                TradeRouteView()
            }
            
            if turn.specialization == .farming {
                FarmRouteView()
            }
            
            if turn.stage == .confirmingFinished {
                Button("Jag är klar") {
                    turn.hasfinished = true
                }
            }
        }.environmentObject(turn)
    }
    
    struct FarmRouteView: View {
        @EnvironmentObject var currentPlayerTurn: PlayerTurn
        
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
        @EnvironmentObject var currentPlayerTurn: PlayerTurn
        
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

struct PlayerTurnView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
