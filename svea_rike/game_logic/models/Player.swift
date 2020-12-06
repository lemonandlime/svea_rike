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
    
    var provinces: [Province] = []
    var eventCards: [EventCard] = []
    var historyCards: [HistoryCard] = []
    var points: Int = 0
    var money: Int = 0
    
    init(name: String, family: Family) {
        self.name = name
        self.family = family
    }
}
