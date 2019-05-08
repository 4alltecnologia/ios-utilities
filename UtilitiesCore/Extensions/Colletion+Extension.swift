//
//  Colletion.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 09/11/2018.
//  Copyright © 2018 4all. All rights reserved.
//

import Foundation

// MARK: - Extension Collection
public extension Collection {
    
    /// Get at index object
    ///
    /// - Parameter index: Index of object
    /// - Returns: Element at index or nil
    func get(at index: Index) -> Iterator.Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
