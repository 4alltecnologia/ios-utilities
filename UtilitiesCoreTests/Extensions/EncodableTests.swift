//
//  EncodableTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 28/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class EncodableTests: XCTestCase {

    struct TestEncodable: Encodable {
        var name: String
        var subTitle: String?
        var amount: Int
    }

    var object: TestEncodable!

    override func setUp() {
        super.setUp()
        object = TestEncodable(name: "Felipe", subTitle: "Great", amount: 10)
    }

    func testObjectToDictionary() {
        let dictionary: [String: Any] = ["name" : "Felipe",
                                         "subTitle": "Great",
                                         "amount": 10]

        let resultDictionary = object.dictionary

        XCTAssertEqual(dictionary["name"] as? String, resultDictionary["name"] as? String)
        XCTAssertEqual(dictionary["subTitle"] as? String, resultDictionary["subTitle"] as? String)
        XCTAssertEqual(dictionary["amount"] as? Int, resultDictionary["amount"] as? Int)
    }

    func testAccessToDictionary() {
        if let name = object["name"] as? String {
            XCTAssertEqual(name, "Felipe")
        } else {
            XCTFail("Cannot generate dictionary")
        }

        if let amount = object["amount"] as? Int {
            XCTAssertEqual(amount, 10)
        } else {
            XCTFail("Cannot generate dictionary")
        }
    }
}

