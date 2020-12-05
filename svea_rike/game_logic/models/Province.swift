//
//  Province.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

enum Province {
    case skane
    case vastergotland
    case uppland
    case narke
    case sodermanland
}


extension Province {
    
    static var all: [Province] {
        return [.skane, vastergotland, uppland, narke, sodermanland]
    }
    
    var display: String {
        switch self {
            case .skane:
                return "Skåne"
            case .vastergotland:
                return "Västergötland"
            case .uppland:
                return "Uppland"
            case .narke:
                return "Närke"
            case .sodermanland:
                return "Södermanland"
        }
    }
}
