//
//  Country.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

enum Country {
    case russia
    case denmark
    case prussia
    case poland
}

extension Country {
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
