//
//  Float+Extension.swift
//  UtilitiesCore
//
//  Created by Luca Saldanha Schifino on 22/03/2018.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension Float {
    
    /// Returns Float's String value with comma and two decimals.
    var cleanValue: String {
        return String(format: "%.2f",self).replacingOccurrences(of: ".", with: ",")
    }
}
