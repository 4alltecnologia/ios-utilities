//
//  IntTests.swift
//  UtilitiesCoreTests
//
//  Created by Betina Pereira de Farias on 14/03/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class IntTests: XCTestCase {
    func testConvertCentsToString() {
        let cents: Int = 1000
        let expectedValue = "R$ 10,00"
        XCTAssertEqual(cents.priceStringFromCents ?? "", expectedValue)
    }
    
    func testBadgeValue() {
        let normalInt: Int = 25
        XCTAssertEqual(normalInt.badgeValue, "25")
        
        let highInt: Int = 200
        XCTAssertEqual(highInt.badgeValue, "99+")
        
        let negativeInt: Int = -10
        XCTAssertNil(negativeInt.badgeValue)
    }
}
