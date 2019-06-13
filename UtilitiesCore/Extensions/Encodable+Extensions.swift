//
//  Encodable+Extensions.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 13/06/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

extension JSONEncoder.DateEncodingStrategy {
    static let customISO8601 = custom {
        var container = $1.singleValueContainer()
        try container.encode(Formatter.iso8601.string(from: $0))
    }
}
