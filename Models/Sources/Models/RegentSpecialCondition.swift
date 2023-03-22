//
//  RegentSpecialCondition.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

public enum RegentSpecialCondition: Hashable {
    case peace
    case godCrops
    case badCrops
    case godTrade
    case war(Country)
}

public class RegentSpecialConditionDeck {
    private var greenDeck: [RegentSpecialCondition]
    private var redDeck: [RegentSpecialCondition]
    private var blueDeck: [RegentSpecialCondition]
    
    public init() {
        greenDeck = [.peace,
                     .peace,
                     .peace,
                     .godCrops,
                     .godTrade,
                     .war(.denmark),
                     .war(.poland),
                     .war(.prussia),
                     .war(.russia)]
        
        redDeck = [.peace,
                   .peace,
                   .peace,
                   .godCrops,
                   .godTrade,
                   .war(.denmark),
                   .war(.poland),
                   .war(.prussia),
                   .war(.russia)]
        
        blueDeck = [.peace,
                    .peace,
                    .peace,
                    .godCrops,
                    .godTrade,
                    .war(.denmark),
                    .war(.poland),
                    .war(.prussia),
                    .war(.russia)]
    }
    
    public func drawSpecialCondition(for era: Era) -> RegentSpecialCondition! {
        switch era {
        case .green:
            return greenDeck.popLast()
        case .red:
            return redDeck.popLast()
        case .blue:
            return blueDeck.popLast()

        }
    }

}

public extension RegentSpecialCondition {
    
    static func newdeck(era: Era) -> [RegentSpecialCondition] {
        switch era {
        case .green:
            return [peace,
                    peace,
                    peace,
                    godCrops,
                    godTrade,
                    war(.denmark),
                    war(.poland),
                    war(.prussia),
                    war(.russia)]
            
        case .red:
            return [peace,
                    peace,
                    peace,
                    godCrops,
                    godTrade,
                    war(.denmark),
                    war(.poland),
                    war(.prussia),
                    war(.russia)]
            
        case .blue:
            return [peace,
                    peace,
                    peace,
                    godCrops,
                    godTrade,
                    war(.denmark),
                    war(.poland),
                    war(.prussia),
                    war(.russia)]
        }
    }
}

public extension RegentSpecialCondition {
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
