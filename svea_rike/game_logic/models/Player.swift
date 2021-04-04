//
//  Player.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

class Player: ObservableObject {
    let name: String
    let family: Family
    
   @Published var provinces: [Province] = []
   @Published var eventCards: [EventCard] = []
   @Published var historyCards: [HistoryCard] = []
   @Published var points: Int = 0
   @Published var money: Int = 0
    
    init(name: String, family: Family) {
        self.name = name
        self.family = family
    }
}
