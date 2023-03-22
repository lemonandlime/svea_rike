//
//  Family.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

public enum Family: Int {
    case sture
    case grip
    case brahe
    case eka
    case treRosor

    public func provinces(numberOfPlayers _: Int) -> [Province] {
        var provinces: [Province]

        switch self {
        case .sture:
            provinces = [.narke]
        case .grip:
            provinces = [.sodermanland]
        case .brahe:
            provinces = [.uppland]
        case .eka:
            provinces = [.vastergotland]
        case .treRosor:
            provinces = [.skane]
        }

        return provinces
    }
}
