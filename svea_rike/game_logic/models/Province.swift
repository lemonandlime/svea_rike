//
//  Province.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

protocol ProvinceProtocol {
    var name: String { get }
    var crowns: Int { get }
    var troops: Int { get }
    var price: Int { get }
    var borderingProvinces: [Province] { get }
}

enum Province {
    case skane
    case vastergotland
    case uppland
    case narke
    case sodermanland
    case lappland
}


extension Province: ProvinceProtocol {
    
    static var all: [Province] {
        return [.skane, vastergotland, uppland, narke, sodermanland, lappland]
    }
    
    var name: String {
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
            case .lappland:
                return "Lappland"
        }
    }
    
    var price: Int {
        switch self {
            case .skane, .vastergotland, .uppland, .narke, .sodermanland:
                return 21
            case .lappland:
                return 8
        }
    }
    
    var crowns: Int {
        switch self {
            case .skane, .vastergotland, .uppland, .narke, .sodermanland:
                return 3
            case .lappland:
                return 1
        }
    }
    
    var troops: Int {
        switch self {
            case .vastergotland, .uppland, .sodermanland:
                return 3
            case .skane, .narke:
                return 2
            case .lappland:
                return 1
        }
    }
    
    var borderingProvinces: [Province] {
        switch self {
            case .skane:
                return []
            case .vastergotland:
                return []
            case .uppland:
                return []
            case .narke:
                return []
            case .sodermanland:
                return []
            case .lappland:
                return []
        }
    }
}
