//
//  Regent.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

enum Regent {
    case gustavVasa
    case gustav2Adolf
}

extension Regent {
    var display: String {
        switch self {
        case .gustavVasa:
            return "Gustav Vasa"
        case .gustav2Adolf:
            return "Gustav II Adolf"
        default:
            return "UNKNOWN"
        }
    }
}
