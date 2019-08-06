//
//  DateFormatter.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 22/11/2018.
//  Copyright © 2018 4all. All rights reserved.
//

import Foundation

public extension DateFormatter {

    /// Default brazilian date formatt dd/MM/yyyy
    static var brazillianDateFormatWithoutTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }
}

public extension ISO8601DateFormatter {
    //swiftlint:disable force_unwrapping
    convenience init(_ formatOptions: Options, timeZone: TimeZone = TimeZone(secondsFromGMT: 0)!) {
        self.init()
        self.formatOptions = formatOptions
        self.timeZone = timeZone
    }
}

public extension Formatter {
    static var iso8601: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        if #available(iOS 11.0, *) {
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        } else {
            formatter.formatOptions = [.withInternetDateTime]
        }
        return formatter
    }
    static let iso8601noFS = ISO8601DateFormatter()
}
