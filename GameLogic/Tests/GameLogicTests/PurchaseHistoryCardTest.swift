import Common
@testable import GameLogic
import Models
import XCTest
import TestHelper

final class PurchaseHistoryCardTest: XCTestCase {
    func testGameHasHistoryCardPurchaseOptions() async throws {
        let sut = try await newGame()
        XCTAssertEqual(sut.historyCards.count, 4)
    }

    func testPurchaseHistoryCard() async throws {
        let sut = try await newGame()
        let playerTurn = sut.turn.currentPlayerTurn
        playerTurn.eventCard = .blokadbrytare
        playerTurn.specialization = .scienceAndCulture
        playerTurn.incomeSource = .farming
        playerTurn.collectedIncome = 0
        playerTurn.paidTroopSupport = 0
        let playerMoney = playerTurn.player.money
        let cardToPurchase = sut.historyCards.first!
        XCTAssertTrue(sut.turn.currentPlayerTurn.player.historyCards.isEmpty)

        try sut.buy(historyCard: cardToPurchase)

        XCTAssertEqual(playerTurn.purchasedHistoryCard, cardToPurchase)
        try await Task.sleep(for: .milliseconds(10))
        XCTAssertFalse(playerTurn.player.historyCards.isEmpty)
        XCTAssertEqual(playerTurn.player.money, playerMoney - cardToPurchase.price)
    }

    func testCantPurchaseHistoryCardWrongState() async throws {
        let sut = try await newGame()
        let playerTurn = sut.turn.currentPlayerTurn
        playerTurn.eventCard = .blokadbrytare
        playerTurn.specialization = .scienceAndCulture
        playerTurn.incomeSource = .farming
        let playerMoney = playerTurn.player.money
        let cardToPurchase = sut.historyCards.first!
        XCTAssertTrue(sut.turn.currentPlayerTurn.player.historyCards.isEmpty)
        XCTAssertThrowsError(try sut.buy(historyCard: cardToPurchase)) { error in
            XCTAssertEqual(error as? GameEngineError, GameEngineError.notInPurchaseState)
        }
    }

    func testCantPurchaseHistoryCardToExpensive() async throws {
        let sut = try await newGame()
        let playerTurn = sut.turn.currentPlayerTurn
        playerTurn.player.money = 1
        let cardToPurchase = sut.historyCards.first!

        XCTAssertThrowsError(try sut.buy(historyCard: cardToPurchase)) { error in
            XCTAssertEqual(error as? GameEngineError, GameEngineError.insufficientFunds)
        }

        try await Task.sleep(for: .milliseconds(10))
        XCTAssertNil(playerTurn.purchasedHistoryCard)
        XCTAssertTrue(playerTurn.player.historyCards.isEmpty)
        XCTAssertEqual(playerTurn.player.money, 1)
    }

    private func newGame() async throws -> Game {
        let game = try GameEngine.createGame(playerNames: ["Will Smith"])
        await game.$historyCards.waitFor { !$0.isEmpty }
        return game
    }
}
