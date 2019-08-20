//
//  FloatTests.swift
//  UtilitiesCoreTests
//
//  Created by Betina Pereira de Farias on 14/03/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class FloatTests: XCTestCase {
    func testFloatCleanValue() {
        let floatValue: Float = 20.5
        let expectedValue = "20,50"
        XCTAssertEqual(floatValue.cleanValue, expectedValue)
    }
}
