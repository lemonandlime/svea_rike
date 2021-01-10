//
//  Turn.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation
import Combine
import SwiftUI

final class Turn: ObservableObject {

    var cancellable = Set<AnyCancellable>()
    var currentPlayerTurnStageObserver: AnyCancellable?
    
    @Published var playerQueue: [PlayerTurn]
    @Published var currentPlayerTurnIndex: Int = 0
    @Published var finished: Bool = false
    
    let specialCondition: RegentSpecialCondition
    let regent: Regent
    
    @Published var currentPlayerTurn: PlayerTurn
        
    init(players: [Player], condition: RegentSpecialCondition, regent: Regent) {
        
        let playerQueue = players.map { PlayerTurn(player: $0) }.shuffled()
                
        self.playerQueue = playerQueue
        self.currentPlayerTurn = playerQueue[0]
        self.specialCondition = condition
        self.regent = regent
        
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
        guard currentPlayerTurnIndex + 1 < playerQueue.endIndex else {
            finished = true
            return
        }
        
        currentPlayerTurnIndex += 1
        currentPlayerTurn = playerQueue[currentPlayerTurnIndex]
        observeCurrentPlayer()
    }
    
    deinit {
        cancellable.forEach { $0.cancel() }
        currentPlayerTurnStageObserver?.cancel()
    }
}

extension Turn: Hashable {
    static func == (lhs: Turn, rhs: Turn) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(playerQueue)
        hasher.combine(currentPlayerTurnIndex)
        hasher.combine(finished)
        hasher.combine(specialCondition)
        hasher.combine(regent)
        hasher.combine(currentPlayerTurn)
    }
}
