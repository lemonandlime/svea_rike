//
//  Country.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

public enum Country {
    case russia
    case denmark
    case prussia
    case poland
}

public extension Country {
    static var all: [Country] {
        [.russia, .denmark, .prussia, .poland]
    }

    var display: String {
        switch self {
        case .russia:
            return "Ryssland"
        case .denmark:
            return "Danmark"
        case .prussia:
            return "Preussen"
        case .poland:
            return "Polen"
        }
    }
}
