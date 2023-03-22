//
//  GameEngine.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Common
import Foundation
import Models

public enum GameEngine {
    public static func createGame(playerNames: [String]) throws -> Game {
        var deck = EventCard.allCases.shuffled()
        var players = createPlayers(playerNames: playerNames)
        let firstTurn = try createFirsTurn(players: players)

        dealEventCards(players: &players, deck: &deck)

        let game = Game(
            players: players,
            era: .green,
            regent: .gustavVasa,
            turn: firstTurn,
            eventCards: deck
        )

        return game
    }

    public static func nextTurn(game: inout Game) throws {
        guard let nextRegent = game.turn.regent.next else {
            print("Game over")
            return
        }

        let condition = game.regentSpecialConditionCards.drawSpecialCondition(for: nextRegent.era)!

        let newTurn = try Turn(players: game.players, condition: condition, regent: nextRegent)
        game.turn = newTurn
    }

    private static func createPlayers(playerNames: [String]) -> [Player] {
        let numberOfPlayers = playerNames.count

        return playerNames.indices.map { index in
            let family = Family(rawValue: index)!
            let player = Player(name: playerNames[index], family: family)
            player.money = 15
            player.provinces = family.provinces(numberOfPlayers: numberOfPlayers)

            return player
        }
    }

    private static func dealEventCards(players: inout [Player], deck: inout [EventCard]) {
        players.forEach { player in
            player.eventCards = deck.popLast(5)
        }
    }

    private static func createFirsTurn(players: [Player]) throws -> Turn {
        try Turn(players: players, condition: .peace, regent: .gustavVasa)
    }
}
