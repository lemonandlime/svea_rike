//
//  Game.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Combine
import Foundation
import SwiftUI

class HistoryCardDeck: ObservableObject {
    @Published var historyCards: [HistoryCard] = []
    @Published var eraHistoryCards: [HistoryCard] = []
    @Published var visibleHistoryCards: [HistoryCard] = []
    @Published var era: Era = .green

    init(historyCards: [HistoryCard], era: Era) {
        setup()
        self.historyCards = historyCards
        self.era = era
    }

    private func setup() {
        $eraHistoryCards
            .map { Array($0.prefix(4)) }
            .receive(on: RunLoop.main)
            .assign(to: &$visibleHistoryCards)

        Publishers.CombineLatest($era, $historyCards)
            .map { era, cards in
                cards.filter { $0.era == era }
            }
            .receive(on: RunLoop.main)
            .assign(to: &$eraHistoryCards)
    }

    func take(_ card: HistoryCard) throws -> HistoryCard {
        guard let index = historyCards.firstIndex(of: card) else {
            throw GameEngineError.cardNotInDeck
        }
        return historyCards.remove(at: index)
    }
}

public class Game: ObservableObject {
    @Published public var players: [Player]
    @Published public var era: Era
    @Published public var regent: Regent
    @Published public var turn: Turn
    @Published public var eventCards: [EventCard]

    // MARK: History Cards

    let historyCardDeck: HistoryCardDeck
    @Published public var historyCards: [HistoryCard] = []

    public var regentSpecialConditionCards = RegentSpecialConditionDeck()

    public init(players: [Player], era: Era, regent: Regent, turn: Turn, eventCards: [EventCard], historyCards: [HistoryCard]) {
        self.players = players
        self.era = era
        self.regent = regent
        self.turn = turn
        self.eventCards = eventCards
        historyCardDeck = HistoryCardDeck(historyCards: historyCards, era: era)
        setup()
    }

    private func setup() {
        historyCardDeck.$visibleHistoryCards.receive(on: RunLoop.main).assign(to: &$historyCards)
    }
}

public extension Game {
    func purchasedHistoryCard(historyCard: HistoryCard) throws {
        guard turn.currentPlayerTurn.player.money >= historyCard.price else {
            throw GameEngineError.insufficientFunds
        }
        turn.currentPlayerTurn.purchasedHistoryCard = try historyCardDeck.take(historyCard)
    }
}
