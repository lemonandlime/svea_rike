import Foundation

public enum GameEngineError: String, LocalizedError {
    case unknown
    case toFewPlayers
    case cardNotInDeck
    case insufficientFunds
    case alreadyPurchasedThisTurn
    case notInPurchaseState

    public var errorDescription: String? {
        return rawValue
    }
}
