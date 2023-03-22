//
//  Player.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

public class Player: ObservableObject {
    public let name: String
    public let family: Family
    
   @Published public var provinces: [Province] = []
   @Published public var eventCards: [EventCard] = []
   @Published public var historyCards: [HistoryCard] = []
   @Published public var points: Int = 0
   @Published public var money: Int = 0
    
    public init(name: String, family: Family) {
        self.name = name
        self.family = family
    }
}
