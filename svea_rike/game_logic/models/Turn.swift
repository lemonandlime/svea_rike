//
//  Turn.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation
import Combine
import SwiftUI

class Turn: ObservableObject {
    var cancellable = Set<AnyCancellable>()
    
    @Published var playerQueue: [(Player, PlayerTurn)]
    
    let specialCondition: RegentSpecialCondition
    
    @Published var currentPlayerTurn: PlayerTurn
    
    var currentPlayer: Player
    
    init(players: [Player], condition: RegentSpecialCondition) {
        
        let playerQueue = players.map { ($0, PlayerTurn()) }
        
        let tuple = playerQueue.dropFirst().first!
        
        self.currentPlayerTurn = tuple.1
        self.currentPlayer = tuple.0
        self.playerQueue = playerQueue
        self.specialCondition = condition

    }
    
    deinit {
        cancellable.forEach { $0.cancel() }
    }
}
