//
//  Regent.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

public enum Regent: String, Hashable {
    case gustavVasa
    case erik14
    case johan3
    case sigismund
    case karl9
    case gustav2
    case kristina
    case karl10
    case karl11
    case karl12
    case ulrika
    case fredrik
    case adolfFredrik
    case gustav3
    case gustav4
    case carl13
}

// MARK: Identifiable

extension Regent: Identifiable {
    public var id: String { rawValue }
}

public extension Regent {
    var name: String {
        switch self {
        case .gustavVasa: return "Gustav Vasa"
        case .erik14: return "Erik XIV"
        case .johan3: return "Johan III"
        case .sigismund: return "Sigismund"
        case .karl9: return "Karl IX"
        case .gustav2: return "Gustav II Adolf"
        case .kristina: return "Kristina"
        case .karl10: return "Karl X Gustav"
        case .karl11: return "Karl XI"
        case .karl12: return "Karl XII"
        case .ulrika: return "Ulrika Eleonora"
        case .fredrik: return "Fredrik I"
        case .adolfFredrik: return "Adolf Fredrik"
        case .gustav3: return "Gustav III"
        case .gustav4: return "Gustav IV Adolf"
        case .carl13: return "Karl XIII"
        }
    }

    var next: Regent? {
        let all = Regent.all

        guard let currentIntdex = all.firstIndex(of: self),
              currentIntdex != all.endIndex
        else {
            return nil
        }

        return all[currentIntdex.advanced(by: 1)]
    }

    var era: Era {
        if Regent.green.contains(self) {
            return .green
        } else if Regent.red.contains(self) {
            return .red
        } else {
            return .blue
        }
    }

    static var all: [Regent] { green + red + blue }
    static var green: [Regent] { [.gustavVasa, .erik14, .johan3, .sigismund, .karl9] }
    static var red: [Regent] { [.gustav2, .kristina, .karl10, .karl11, .karl12] }
    static var blue: [Regent] { [.ulrika, .fredrik, .adolfFredrik, .gustav3, .gustav4, .carl13] }
}
