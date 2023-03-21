//
//  HistoryCard.swift
//  svea_rike
//
//  Created by Karl Soderberg on 2020-11-24.
//

import Foundation


protocol HistoryCardProtocol {
    var name: String { get }
    var description: String { get }
    var price: Int { get }
    var cardType: HistoryCardType { get }
    var era: Era { get }
}

enum HistoryCard: HistoryCardProtocol {
    case tyska_knektar
    case maria_elionora
    case lennart_torstensson
    case ostindiska_kompaniet
    case falu_koppargruva
    case viborgs_fastning
    case johannes_bureus
    case gustaf_horn
    case johan_henric_kellgren
    case kungliga_slottet
    case olaus_magnus
    case haga
    case karin_mansdotter
    case hattpartiet
    case carl_gustaf_armfeldi
    case sofia_magdalena
    case ostersjoflotta
    case carl_von_linne
    case axel_von_fersen
    case finska_rytteriet
    case forbindelser_med_hansan
    case conrad_von_pyhy
    case bergsbruk
    case olaus_petri
    case drots
    case orbyhus
    case jordreform
    case anders_celsius
    case skokloster
    case katarina_jagellonica
    case vadstena
    case karoliner
    case kanslipresident
    case georg_carl_von_dobeln
    case emmanuel_swedenborg
    case tycho_brahe
    case tons_tacob_berzelius
    case lovisa_ulrika
    case glimmingehus
    case manufakturier
    case sala_silvergruva
    case gripsholm
    case georg_stiernhielm
    case hedvig_eleonora
    case carl_michael_bellman
    
    var name: String {
        "history card name"
    }
    
    var description: String {
        "historycard description"
    }
    
    var price: Int {
        2
    }
    
    var cardType: HistoryCardType {
        switch self {
            case .queen1, .queen2, .queen3:
                return .queen
            case .culturePerson1, .culturePerson2, .culturePerson3:
                return .culturePerson
        }
    }
    
    var era: Era {
        .green
    }
    
}

enum HistoryCardType {
    case queen
    case culturePerson
    case castle
    case army
    case general
    case scientist
    case resource
}
