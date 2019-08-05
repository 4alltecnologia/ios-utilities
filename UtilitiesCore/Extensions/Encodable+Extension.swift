//
//  Encodable+Extension.swift
//  UtilitiesCore
//
//  Created by Felipe Dias Pereira on 28/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

public extension Encodable {
    /// Subscript to access the encodable object as a dictionary, returns Any object or nil if not found
    ///
    /// - Parameter key: The parameter name like a key in a dictionary
    subscript(key: String) -> Any? {
        return dictionary[key]
    }

    /// Create a dictionary from Encodable object, uses jsonEncodar and JsonSerialization to do so
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
}
