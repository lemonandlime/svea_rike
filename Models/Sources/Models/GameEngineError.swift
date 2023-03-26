import Foundation

public enum GameEngineError: Error {
    case toFewPlayers
    case cardNotInDeck
    case insufficientFunds
}
