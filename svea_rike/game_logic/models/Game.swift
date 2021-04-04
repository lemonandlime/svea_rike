//
//  Game.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation
import SwiftUI

class Game: ObservableObject {
    
    @Published var players: [Player]
    @Published var era: Era
    @Published var regent: Regent
    @Published var turn: Turn
    @Published var eventCards: [EventCard]
    
    var regentSpecialConditionCards = RegentSpecialConditionDeck()
    
        
    init(players: [Player], era: Era, regent: Regent, turn: Turn, eventCards: [EventCard]) {
        self.players = players
        self.era = era
        self.regent = regent
        self.turn = turn
        self.eventCards = eventCards
    }
}
