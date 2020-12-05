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
    var currentPlayerTurnStageObserver: AnyCancellable?
    
    @Published var playerQueue: [(Player, PlayerTurn)]
    @Published var currentPlayerTurnIndex: Int = 0
    
    let specialCondition: RegentSpecialCondition
    
    @Published var currentPlayerTurn: PlayerTurn
    
    var currentPlayer: Player
    
    init(players: [Player], condition: RegentSpecialCondition) {
        
        let playerQueue = players.map { ($0, PlayerTurn()) }
                
        self.playerQueue = playerQueue
        self.currentPlayer = playerQueue[0].0
        self.currentPlayerTurn = playerQueue[0].1
        self.specialCondition = condition
        
        observeCurrentPlayer()
    }
    
    private func observeCurrentPlayer() {
        currentPlayerTurnStageObserver?.cancel()
        
        currentPlayerTurnStageObserver =
            currentPlayerTurn.$hasfinished
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .sink { finishedTurn in
                if finishedTurn {
                    self.onPlayerHasFinishedTurn()
                }
            }
        
    }
    
    private func onPlayerHasFinishedTurn() {
        currentPlayerTurnIndex += 1
        currentPlayer = playerQueue[currentPlayerTurnIndex].0
        currentPlayerTurn = playerQueue[currentPlayerTurnIndex].1
        observeCurrentPlayer()
    }
    
    deinit {
        cancellable.forEach { $0.cancel() }
        currentPlayerTurnStageObserver?.cancel()
    }
}
