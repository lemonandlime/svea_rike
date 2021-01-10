//
//  GameEngine.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

class GameEngine {
    
    static func createGame(playerNames: [String]) -> Game {
        let players = createPlayers(playerNames: playerNames)
        
        let game = Game(players: players,
                        era: .green,
                        regent: .gustavVasa,
                        turn: createFirsTurn(players: players))
        
        return game
    }
    
    static func nextTurn(game: inout Game) {
        guard let nextRegent = game.turn.regent.next else {
            print("Game over")
            return
        }
        
        let newTurn = Turn(players: game.players, condition: .peace, regent: nextRegent)
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
    
    private static func createFirsTurn(players: [Player]) -> Turn {
        Turn(players: players, condition: .peace, regent: .gustavVasa)
    }
}
