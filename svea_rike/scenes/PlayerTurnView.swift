//
//  PlayerTurnView.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-12-05.
//

import SwiftUI

struct PlayerTurnView: View {
    @ObservedObject var turn: PlayerTurn
        
    var body: some View {
        VStack {
            InfoBox()
            
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
            
            if turn.specialization == .scienceAndCulture {
                ScienceAndCultureRouteView()
            }
            
            if turn.stage == .confirmingFinished {
                Button("Jag är klar") {
                    turn.hasfinished = true
                }
            }
        }.environmentObject(turn)
    }
    
    struct InfoBox: View {
        @EnvironmentObject var turn: PlayerTurn
        var body: some View {
            
            HStack {
                Text("Spelares tur")
                Spacer()
                Text(turn.player.name)
            }
            HStack {
                Text("Pengar")
                Spacer()
                Text(turn.player.money.description)
            }
            
            Text("Förläningar")
            HStack {
                ForEach(turn.player.provinces, id: \.self) {
                    Text($0.name)
                }
            }
            
            Text(turn.stage.display)
        }
    }
    
    struct ScienceAndCultureRouteView: View {
        
        @EnvironmentObject var turn: PlayerTurn
        
        var body: some View {
            Group {
                
                if turn.stage == .selectingIncomeSource {
                    HStack {
                        
                        Button("Jordbruk") {
                            turn.incomeSource = .farming
                        }
                        
                        Button("Handel") {
                            turn.incomeSource = .trade
                        }
                    }
                    
                }
                                
                if turn.stage == .collectingTradeIncome {
                    Button("Inkassera inkomster") {
                        turn.collectedIncome = 5
                    }
                }
                
                if turn.stage == .collectionFarmingIncome {
                    Button("Inkassera inkomster") {
                        turn.collectedIncome = 5
                    }
                }
                
                if turn.stage == .payingTroops {
                    Button("Betala") {
                        turn.paidTroopSupport = 3
                    }
                }
                
                if turn.stage == .purchasingHistoryCard {
                    Button("Skippa köp") {
                        turn.skippedHistoryCardPurchase = true
                    }
                }
            }
        }
    }

    
    struct FarmRouteView: View {
        
        @EnvironmentObject var turn: PlayerTurn
        
        var body: some View {
            Group {
                
                if turn.stage == .collectionFarmingIncome {
                    Button("Inkassera inkomster") {
                        turn.collectedIncome = turn.player.provinces.reduce(0) { value, province in
                            value + province.crowns
                        }
                    }
                }
                
                if turn.stage == .purchasingProvince {
                    HStack {
                        ForEach(Province.all, id: \.self) { province in
                            Button(province.name) {
                                turn.purchasedProvince = province
                            }
                        }
                    }
                }
                
                if turn.stage == .collectingTradeIncome {
                    Button("Inkassera inkomster") {
                        turn.collectedIncome = 5
                    }
                }
                
                if turn.stage == .payingTroops {
                    Button("Betala") {
                        turn.paidTroopSupport = 3
                    }
                }
            }
        }
    }
    
    struct TradeRouteView: View {
        @EnvironmentObject var turn: PlayerTurn
        
        var body: some View {
            Group {
                if turn.stage == .placingMerchant {
                    HStack {
                        ForEach(Country.all, id: \.self) { country in
                            Button(country.display) {
                                turn.addedMerchant = country
                            }
                        }
                    }
                }
                
                if turn.stage == .collectingTradeIncome {
                    Button("Inkassera inkomster") {
                        turn.collectedIncome = 5
                    }
                }
                
                if turn.stage == .payingTroops {
                    Button("Betala") {
                        turn.paidTroopSupport = 3
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
