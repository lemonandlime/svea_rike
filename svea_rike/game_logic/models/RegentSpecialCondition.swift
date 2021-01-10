//
//  RegentSpecialCondition.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

enum RegentSpecialCondition: Hashable {
    case peace
    case godCrops
    case badCrops
    case godTrade
    case war(Country)
}

extension RegentSpecialCondition {
    var display: String {
        switch self {
        case .peace:
            return "Fred"
        case .godCrops:
            return "Goda skördar"
        case .badCrops:
            return "Missväxt"
        case .godTrade:
            return "Efterfrågan på importprodukter"
        case .war(let country):
            return "Krig med \(country.display)"
        }
    }
}
