//
//  HistoryCard.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-24.
//

import Foundation


protocol HistoryCardProtocol {
    var name: String { get }
    var description: String { get }
    var price: Int { get }
    var cardType: HistoryCardType { get }
    var era: Era { get }
}

enum HistoryCard: HistoryCardProtocol {
    case queen1
    case queen2
    case queen3
    case culturePerson1
    case culturePerson2
    case culturePerson3
    
    var name: String {
        "history card name"
    }
    
    var description: String {
        "historycard description"
    }
    
    var price: Int {
        2
    }
    
    var cardType: HistoryCardType {
        switch self {
            case .queen1, .queen2, .queen3:
                return .queen
            case .culturePerson1, .culturePerson2, .culturePerson3:
                return .culturePerson
        }
    }
    
    var era: Era {
        .green
    }
    
}

enum HistoryCardType {
    case queen
    case culturePerson
    case castle
    case army
    case general
    case scientist
    case resource
}
