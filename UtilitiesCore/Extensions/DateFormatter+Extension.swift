//
//  DateFormatter.swift
//  Elo
//
//  Created by Felipe Dias Pereira on 22/11/2018.
//  Copyright © 2018 4all. All rights reserved.
//

import Foundation

public extension DateFormatter {

    /// Default brazilian date formatt dd/MM/yyyy
    static let brazillianDateFormatWithoutTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}
