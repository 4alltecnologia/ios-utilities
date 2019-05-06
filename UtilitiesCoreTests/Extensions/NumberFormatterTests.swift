//
//  NumberFormatterTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 02/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class NumberFormatterTests: XCTestCase {

    func testBrazilianCurrencyFormatterToString() {
        let formatter = NumberFormatter.brazilianCurrencyFormatter
        let number = 120.0

        let currencyFormated = formatter.string(from: NSNumber(value: number))

        XCTAssertEqual(currencyFormated, "R$ 120,00")
    }

    func testBrazilianCurrencyFormatterToNumber() {
        let formatter = NumberFormatter.brazilianCurrencyFormatter
        let numberString = "R$ 1.200,12"

        let number = formatter.number(from: numberString)

        XCTAssertEqual(number, 1200.12)
    }
}
