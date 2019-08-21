//
//  Date+Extension.swift
//  UtilitiesCore
//
//  Created by Luca Saldanha Schifino on 07/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension Date {
    
    /// String describing elapsed time from date to now.
    var brazilianElapsedInterval: String {
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour], from: self, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "há \(year)" + " " + "ano" :
                "há \(year)" + " " + "anos"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "há \(month)" + " " + "mês" :
                "há \(month)" + " " + "meses"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "há \(day)" + " " + "dia" :
                "há \(day)" + " " + "dias"
        } else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "há \(hour)" + " " + "hora" :
                "há \(hour)" + " " + "horas"
        } else {
            return "agora"
        }
    }
    
    /// Returns String from date.
    ///
    /// - Parameters:
    ///   - format: Date format.
    ///   - timezone: TimeZone for the date. If none is passed, the device's locale is used.
    /// - Returns: Date's String.
    func getString(withFormat format: String, andTimezoneAbbreviation abbreviation: String? = nil) -> String {
        let dateFormatter = DateFormatter()
        if let abbreviation = abbreviation {
            dateFormatter.timeZone = TimeZone(abbreviation: abbreviation)
        }
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
