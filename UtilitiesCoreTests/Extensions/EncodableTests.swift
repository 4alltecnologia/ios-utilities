//
//  EncodableTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 13/06/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class EncodableTests: XCTestCase {

    func testEncodeCustomISO8601DateStrategy() {
        // Given
        let dateString = "2019-03-12T19:18:11.000Z"
        let date = Formatter.iso8601.date(from: dateString)

        struct TestObject: Encodable {
            var name: String
            var createdAt: Date
        }

        let object = TestObject(name: "Felipe", createdAt: date!)

        // When
        do {
            let dictionaryComparable = [ "name" : "Felipe",
                                         "createdAt" : "2019-03-12T19:18:11.000Z"]

            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .customISO8601

            let data = try encoder.encode(object)
            guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] else {
                XCTFail( "cannot parse to dictionary")
                return
            }

            let name = dictionary["name"] as? String
            let date = dictionary["createdAt"] as? String

            // Then
            XCTAssertEqual(dictionaryComparable["name"], name)
            XCTAssertEqual(dictionaryComparable["createdAt"], date)
        } catch {
            XCTFail("Failed on parsing json")
        }
    }
}
