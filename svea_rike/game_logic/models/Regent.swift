//
//  Regent.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

enum Regent: Int {
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

extension Regent {
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
}
