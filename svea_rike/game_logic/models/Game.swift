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
    @ObservedObject var turn: Turn
        
    init(players: [Player], era: Era, regent: Regent, turn: Turn) {
        self.players = players
        self.era = era
        self.regent = regent
        self.turn = turn
    }
}
