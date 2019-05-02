//
//  StringTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 02/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {

    func testGetOnlyNumbersFromString() {
        let auxString = "Ba12nana"
        let digits = auxString.numbersOnly

        XCTAssertEqual("12", digits)
    }

    func testStringHasNumber() {
        let auxString1 = "Coco123nut"

        XCTAssertFalse(auxString1.hasOnlyNumbers)

        let auxString2 = "123"

        XCTAssertTrue(auxString2.hasOnlyNumbers)
    }

    func testeStringRemovingWhiteSpaces() {
        let auxString = " Saibot says, Hello World!"

        let newString = auxString.stringByRemovingWhitespaces

        XCTAssertEqual(newString, "Saibotsays,HelloWorld!")
    }

    func testTransformDateFormat() {
        let auxString = "23/09/1990"

        let newString = auxString.transformDateFormat("dd/MM/yyyy", new: "yyyy-dd-MM")

        XCTAssertEqual(newString, "1990-23-09")
    }

    func testBrazilianCurrentFormatTransform() {
        let auxString = "R$ 1.200,12"
        let number = auxString.brazilianCurrencyNumber

        XCTAssertEqual(number, 1200.12)
    }
}
