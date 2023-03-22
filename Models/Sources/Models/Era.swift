//
//  Era.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation
import SwiftUI

public enum Era {
    case green
    case red
    case blue
}

public extension Era {
    
    var display: String {
        switch self {
        case .green:
            return "Vasatiden"
        case .red:
            return "Stormaktstiden"
        case .blue:
            return "FrihetsTiden"

        }
    }
    
    var primaryColor: Color {
        switch self {
        case .green:
            return .green
        case .red:
            return .red
        case .blue:
            return .blue

        }
    }
    
    var regents: [Regent] {
        switch self {
        case .green:
            return Regent.green
        case .red:
            return Regent.red
        case .blue:
            return Regent.blue

        }
    }
}
