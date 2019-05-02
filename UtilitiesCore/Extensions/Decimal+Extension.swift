//
//  Decimal.swift
//  Elo
//
//  Created by Felipe Dias Pereira on 28/11/2018.
//  Copyright © 2018 4all. All rights reserved.
//

import Foundation

// MARK: - Decimal
public extension Decimal {

    /// Use this variable to get double value from decimal
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
