//
//  DecodableTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 13/06/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class DecodableTests: XCTestCase {

    func testDecodeCustomISO8601DateStrategy() {
        // Given
        let dictionary = [ "name" : "Felipe",
                           "createdAt" : "2019-03-12T19:18:11.000Z"]

        let dateString = "2019-03-12T19:18:11.000Z"
        let date = Formatter.iso8601.date(from: dateString)

        struct TestObject: Decodable {
            var name: String
            var createdAt: Date
        }

        // When
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options:[])

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .customISO8601
            let object = try decoder.decode(TestObject.self, from: jsonData)

            // Then
            XCTAssertEqual(object.createdAt, date)
        } catch {
            XCTFail("Failed on parsing json")
        }
    }
}
