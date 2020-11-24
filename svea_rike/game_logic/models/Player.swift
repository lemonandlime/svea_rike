//
//  Player.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

struct Player {
    let name: String
    let family: Family
    
    var provinces: [Province]
    var eventCards: [EventCard]
    var points: Int
}
