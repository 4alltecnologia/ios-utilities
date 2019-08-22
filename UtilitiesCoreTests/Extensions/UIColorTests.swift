//
//  UIColorTests.swift
//  UtilitiesCoreTests
//
//  Created by Luca Saldanha Schifino on 14/03/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class UIColorTests: XCTestCase {

    func testHexStringToColor() {
        let possibleValues = ["#ffffff", "ffffff"]
        for value in possibleValues {
            let color = UIColor.hexStringToColor(hex: value)
            let expectedResult = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            XCTAssertEqual(color, expectedResult)
        }
    }
    
    func testColorToHexString() {
        let color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let hex = color.hexString
        XCTAssertEqual(hex, "FFFFFF")
    }
}
