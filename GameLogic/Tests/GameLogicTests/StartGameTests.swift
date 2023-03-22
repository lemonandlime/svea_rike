//
//  StartGameTests.swift
//
//
//  Created by Karl Söderberg on 2023-03-22.
//

@testable import GameLogic
import Models
import XCTest

final class StartGameTests: XCTestCase {
    let playerNames = ["Eminem", "Madonna", "Freddie"]

    func testShouldStartInGreenEra() throws {
        XCTAssertEqual(try newGame().era, .green)
    }

    func testShouldHavePlayers() throws {
        XCTAssertEqual(try newGame().players.count, playerNames.count)
    }

    func testShouldBePeaceAtStart() throws {
        XCTAssertEqual(try newGame().turn.specialCondition, .peace)
    }

    func testAllPlayersShouldHave15SilverAtStart() throws {
        try newGame().players.forEach { player in
            XCTAssertEqual(player.money, 15)
        }
    }

    func testAllPlayersShouldHaveEventCardsAtStart() throws {
        try newGame().players.forEach { player in
            XCTAssertEqual(player.eventCards.count, 5)
        }
    }

    func testAllPlayersShouldHaveNoHistoryCardsAtStart() throws {
        try newGame().players.forEach { player in
            XCTAssertTrue(player.historyCards.isEmpty)
        }
    }

    func testAllPlayersShouldHaveProvincesAtStart() throws {
        try newGame().players.forEach { player in
            XCTAssertFalse(player.provinces.isEmpty)
        }
    }

    func testHaveToHavePlayers() {
        XCTAssertThrowsError(try GameEngine.createGame(playerNames: []))
    }

    private func newGame() throws -> Game {
        try GameEngine.createGame(playerNames: playerNames)
    }
}
