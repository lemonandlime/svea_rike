//
//  Game.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation
import SwiftUI

public class Game: ObservableObject {
    @Published public var players: [Player]
    @Published public var era: Era
    @Published public var regent: Regent
    @Published public var turn: Turn
    @Published public var eventCards: [EventCard]

    public var regentSpecialConditionCards = RegentSpecialConditionDeck()

    public init(players: [Player], era: Era, regent: Regent, turn: Turn, eventCards: [EventCard]) {
        self.players = players
        self.era = era
        self.regent = regent
        self.turn = turn
        self.eventCards = eventCards
    }
}
