//
//  Int+Extension.swift
//  UtilitiesCore
//
//  Created by Betina Pereira de Farias on 03/12/18.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension Int {
    
    /// Returns price String from cents.
    var priceStringFromCents: String? {
        let formatter = NumberFormatter.brazilianCurrencyFormatter
        let amountFloat = Float(self)
        let price = amountFloat/100
        guard let priceString = formatter.string(from: NSNumber(value: price)) else {
            return nil
        }
        return priceString
    }
    
    /// Returns the Int's representation on a badge.
    var badgeValue: String? {
        if self > 99 {
            return "99+"
        } else if self <= 0 {
            return nil
        }
        return String(self)
    }
}
