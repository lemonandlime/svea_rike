//
//  Array+Extensions.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2021-01-10.
//

import Foundation

public extension Array {
    
    func object(at index: Int) -> Element? {
        guard self.endIndex < index else {
            return nil
        }
        
        return self[index]
    }
    
    mutating func popLast(_ number: Int = 1) -> [Element] {
        var elements = [Element]()
        
        repeat {
            if let element = popLast() {
                elements.append(element)
            }
        } while elements.count < number && !self.isEmpty
        
        return elements
    }
}
