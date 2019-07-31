//
//  NumberFormatter+extension.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 2019-04-19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension NumberFormatter {

    /// Use this variable to get double value from decimal
    static var brazilianCurrencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
}
