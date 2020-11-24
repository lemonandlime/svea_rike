//
//  Era.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

enum Era {
    case vasaTiden
    case stormaktsTiden
    case frihetsTiden
}

extension Era {
    var display: String {
        switch self {
        case .vasaTiden:
            return "Vasatiden"
        case .stormaktsTiden:
            return "Stormaktstiden"
        case .frihetsTiden:
            return "FrihetsTiden"

        }
    }
}
