//
//  Decode+Extension.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 13/06/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601 = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = Formatter.iso8601.date(from: string) ?? Formatter.iso8601noFS.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}
