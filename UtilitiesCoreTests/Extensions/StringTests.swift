//
//  StringTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 02/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class StringTests: XCTestCase {

    func testStringIntegerSubscriptable() {
        let hello = "Hello World"

        let partialRangeFrom = hello[3...]
        let partialRangeTo = hello[..<7]
        let partialRangeThrough = hello[...7]
        let closedRange = hello[3...7]
        let range = hello[3..<7]

        XCTAssertEqual(partialRangeFrom, "lo World")
        XCTAssertEqual(partialRangeTo, "Hello W")
        XCTAssertEqual(partialRangeThrough, "Hello Wo")
        XCTAssertEqual(closedRange, "lo Wo")
        XCTAssertEqual(range, "lo W")
    }

    func testGetOnlyNumbersFromString() {
        let auxString = "Ba12nana"
        let digits = auxString.numbersOnly

        XCTAssertEqual("12", digits)
    }

    func testStringHasNumbers() {
        let auxString1 = "Coco123nut"

        XCTAssertTrue(auxString1.hasNumbers)
    }

    func testStringHasOnlyNumbers() {
        let auxString1 = "Coco123nut"

        XCTAssertFalse(auxString1.hasOnlyNumbers)

        let auxString2 = "123"

        XCTAssertTrue(auxString2.hasOnlyNumbers)
    }

    func testGetOnlyLettersFromString() {
        let auxString = "Ba12nana"
        let letters = auxString.lettersOnly

        XCTAssertEqual("Banana", letters)
    }

    func testStringHasLetters() {
        let auxString1 = "Coco123nut"

        XCTAssertTrue(auxString1.hasLetters)
    }

    func testStringHasOnlyLetters() {
        let auxString1 = "Coco123nut"

        XCTAssertFalse(auxString1.hasOnlyLetters)

        let auxString2 = "abc"

        XCTAssertTrue(auxString2.hasOnlyLetters)
    }

    func testStringIsAlphanumeric() {
        let auxString1 = "Coco123nut"

        XCTAssertTrue(auxString1.isAlphaNumeric)

        let auxString2 = "abc"

        XCTAssertFalse(auxString2.isAlphaNumeric)
    }

    func testStringRemovingWhitespaces() {
        let auxString = " Saibot says, Hello World!"

        let newString = auxString.removingWhitespaces

        XCTAssertEqual(newString, "Saibotsays,HelloWorld!")
    }

    func testStringTrimmingWhitespacesAndNewLines() {
        let auxString = " Saibot says, Hello World!\n "

        let newString = auxString.trimmingWhitespacesAndNewLines

        XCTAssertEqual(newString, "Saibot says, Hello World!")
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
    
    func testCurrencyFormat() {
        let possibleValues = ["5000", "R$ 5000", "5,000", "R$ 50,00"]
        for value in possibleValues {
            XCTAssertEqual(value.textFieldCurrencyFormat, "R$\u{00a0}50,00")
        }
    }
    
    func testAmountCentsFormat() {
        let cents = 1000
        guard let amountString = cents.priceStringFromCents else {
            XCTFail("Couldn't get price string")
            return
        }
        XCTAssertEqual(amountString, "R$ 10,00")
        
        guard let centsFromString = amountString.amountCentsFormat else {
            XCTFail("Couldn't get cents amount")
            return
        }
        XCTAssertEqual(centsFromString, cents)
    }
    
    func testGetDate() {
        let dateString = "06/11/1994 22:00:00"
        let expectedResult = Date(timeIntervalSince1970: 784166400)
        let date = dateString.getDate(withInputFormat: "dd/MM/yyyy HH:mm:ss")
        XCTAssertEqual(expectedResult, date)
    }
}
