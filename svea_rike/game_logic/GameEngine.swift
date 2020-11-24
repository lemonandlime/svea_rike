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
                        era: .vasaTiden,
                        regent: .gustavVasa,
                        turn: createFirsTurn(players: players))
        
        return game
    }
    
    private static func createPlayers(playerNames: [String]) -> [Player] {
        
        let numberOfPlayers = playerNames.count
        
        return playerNames.indices.map { index in
            let family = Family(rawValue: index)!
            let provinces = family.provinces(numberOfPlayers: numberOfPlayers)
            
            return Player(name: playerNames[index],
                          family: family,
                          provinces: provinces,
                          eventCards: [],
                          points: 0)
        }
    }
    
    private static func createFirsTurn(players: [Player]) -> Turn {
        Turn(players: players, condition: .peace)
    }
}
