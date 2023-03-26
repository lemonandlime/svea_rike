//
//  ContentView.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Combine
import GameLogic
import Models
import SwiftUI

class ViewModel: ObservableObject {
    var cancellable = Set<AnyCancellable>()
    var playerTurnObserver: AnyCancellable?
    var turnFinishedObserver: AnyCancellable?

    var turnObserver: AnyCancellable?

    var game: Game

    @Published var currentPlayerTurn: PlayerTurn
    @Published var currentTurn: Turn
    @Published var currentTurnFinished = false
    @Published var error: GameEngineError?
    @Published var presentAlert = false

    init(game: Game) {
        self.game = game
        currentTurn = game.turn
        currentPlayerTurn = game.turn.currentPlayerTurn

        turnObserver =
            game.$turn
                .receive(on: RunLoop.main)
                .removeDuplicates()
                .sink { turn in
                    self.currentTurn = turn
                    self.observeCurrentTurn(turn)
                }

        $error
            .receive(on: RunLoop.main)
            .map { $0 != nil}
            .assign(to: &$presentAlert)
    }

    func observeCurrentTurn(_ turn: Turn) {
        playerTurnObserver?.cancel()
        turnFinishedObserver?.cancel()

        playerTurnObserver =
            turn.$currentPlayerTurn
                .receive(on: RunLoop.main)
                .removeDuplicates()
                .assign(to: \.currentPlayerTurn, on: self)

        turnFinishedObserver =
            turn.$finished
                .receive(on: RunLoop.main)
                .assign(to: \.currentTurnFinished, on: self)
    }

    @MainActor
    func startNewTurn() {
        do {
            try GameEngine.nextTurn(game: &game)
        } catch {
            setError(error)
        }
    }

    @MainActor
    func purchaseHistoryCard(_ card: HistoryCard) {
        do {
            try game.buy(historyCard: card)
        } catch {
            setError(error)
        }
    }

    @MainActor
    func setError(_ error: Error) {
        self.error = error as? GameEngineError ?? GameEngineError.unknown
    }

    deinit {
        cancellable.forEach { $0.cancel() }
    }
}

struct ContentView: View {
    @ObservedObject var vm: ViewModel

    init() {
        let game = try! GameEngine.createGame(playerNames: ["Kalle"])
        vm = .init(game: game)
    }

    var body: some View {
        ZStack {
            Image("board")
                .resizable()
                .ignoresSafeArea(.all, edges: .all)
                .aspectRatio(contentMode: ContentMode.fit)

            VStack(alignment: .leading, spacing: 15) {
                RegentLineView(turn: vm.currentTurn)
                    .frame(height: 40)
                    .padding(.horizontal, 60)
                    .padding(.bottom, 50)

                Spacer()

                if vm.currentTurnFinished {
                    Button("Starta nästa regentstid", action: vm.startNewTurn)
                }

                HistoryCardPickerView(game: vm.game) { card in
                    vm.purchaseHistoryCard(card)
                }

                PlayerTurnView(turn: vm.currentPlayerTurn)

            }.padding()
        }
        .alert(isPresented: $vm.presentAlert, error: vm.error) {
            Text("Ok")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
