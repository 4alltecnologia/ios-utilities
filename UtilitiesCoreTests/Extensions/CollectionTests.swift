//
//  CollectionTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 02/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class CollectionTests: XCTestCase {

    let testingArray = ["banana","apple","coconut"]

    func testGetValidIndex() {
        let object = testingArray.get(at: 2)

        XCTAssertEqual(object, "coconut")
    }

    func testGetInvalidIndex() {
        let object = testingArray.get(at: 12)

        XCTAssertNil(object)
    }
}
