//
//  Array+Extensions.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2021-01-10.
//

import Foundation

extension Array {
    
    func object(at index: Int) -> Element? {
        guard self.endIndex < index else {
            return nil
        }
        
        return self[index]
    }
}
