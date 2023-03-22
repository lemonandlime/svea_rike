//
//  Dice.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation

enum DiceRoll: Int {
    case one
    case two
    case three
    case fore
    case five
    case six
    
    static func roll() -> DiceRoll {
        all.randomElement()!
    }
    
    private static var all: [DiceRoll] = [one, two, three, fore, five, six]
}
