//
//  Turn.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Combine
import Foundation
import SwiftUI

public final class Turn: ObservableObject {
    var cancellable = Set<AnyCancellable>()
    var currentPlayerTurnStageObserver: AnyCancellable?

    @Published var playerQueue: [PlayerTurn]
    @Published var currentPlayerTurnIndex: Int = 0
    @Published public var finished: Bool = false

    public let specialCondition: RegentSpecialCondition
    public let regent: Regent

    @Published public var currentPlayerTurn: PlayerTurn

    public init(players: [Player], condition: RegentSpecialCondition, regent: Regent) {
        let playerQueue = players.map { PlayerTurn(player: $0) }.shuffled()

        self.playerQueue = playerQueue
        currentPlayerTurn = playerQueue[0]
        specialCondition = condition
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

// MARK: Hashable

extension Turn: Hashable {
    public static func == (lhs: Turn, rhs: Turn) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(playerQueue)
        hasher.combine(currentPlayerTurnIndex)
        hasher.combine(finished)
        hasher.combine(specialCondition)
        hasher.combine(regent)
        hasher.combine(currentPlayerTurn)
    }
}
