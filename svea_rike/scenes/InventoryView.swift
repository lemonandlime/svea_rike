//
//  InventoryView.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2021-01-10.
//

import SwiftUI

struct InventoryView: View {
    @ObservedObject var player: Player
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(player.points.description).bold() + Text(" AP")
                Text(player.money.description).bold() + Text(" Silver")
                
                Text("Historiekort").font(.title2)
                
            }.font(.title3)
            
            Spacer()
            
            ProvinceList(provinces: player.provinces)
            
            Spacer()
            
            EventCardList(cards: player.eventCards)
            
        }
    }
        
    private struct EventCardList: View {
        let cards: [EventCard]
        
        @State var expandedEventCard: EventCard? = nil
        
        var body: some View {
            VStack {
                ForEach(cards, id: \.self) { eventCard in
                    Button(action:{ setExpanded(eventCard) }) {
                        VStack(spacing: 10) {
                            Text(eventCard.name).font(.headline)
                            if eventCard == expandedEventCard {
                                Text(eventCard.description)
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                            }
                           
                        }
                        .padding()
                        .clipped()
                        .frame(width: 300, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(lineWidth: 2, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/))
                        .animation(.easeIn, value: expandedEventCard)
                        
                    }
                    
                }
            }
        }
        
        private func setExpanded(_ card: EventCard?) {
            if card == expandedEventCard {
                expandedEventCard = nil
            } else {
                expandedEventCard = card
            }
        }
    }
    
    private struct ProvinceList: View {
        let provinces: [Province]
        
        @State var expanded: Province? = nil
        
        var body: some View {
            VStack {
                ForEach(provinces, id: \.self) { province in
                    Button(action:{ setExpanded(province) }) {
                        VStack(spacing: 2) {
                            HStack {
                                ForEach(0..<province.crowns) { _ in
                                    Image(systemName: "crown").font(.title)
                                }
                            }
                            Text(province.name).font(.headline)
                            
                            if province == expanded {
                                Spacer().frame(height: 10)
                                HStack {
                                    ForEach(0..<province.crowns) { _ in
                                        Image(systemName: "figure.wave").font(.title)
                                    }
                                }.frame(maxWidth: .infinity)
                                .overlay(Image(systemName: costIconName(province)).font(.title), alignment: .bottomTrailing)
                            }
                            
                        }
                        .padding(5)
                        .clipped()
                        .frame(width: 300, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(lineWidth: 2, antialiased: true))
                        .animation(.easeIn, value: expanded)
                        
                    }
                    
                }
            }
        }
        
        private func costIconName(_ province: Province) -> String {
            if province.price < 10 {
                return "0\(province.price).circle.fill"
            } else {
                return "\(province.price).circle.fill"
            }
        }
        
        private func setExpanded(_ province: Province?) {
            if province == expanded {
                expanded = nil
            } else {
                expanded = province
            }
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            Spacer()
            
            InventoryView(player: GameEngine.createGame(playerNames: ["kalle"]).players.first!)
                .padding(.horizontal)
        }
       
    }
}
