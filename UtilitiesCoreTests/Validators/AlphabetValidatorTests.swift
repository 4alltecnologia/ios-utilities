//
//  AlphabetValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 08/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class AlphabetValidatorTests: XCTestCase {
    var alphabetValidator: ValidatorConvertible!

    override func setUp() {
        super.setUp()
        alphabetValidator = ValidatorFactory.validatorFor(type: .alphabet)
    }

    func testShouldNotAcceptEmptyValues() {
        let validationResult = alphabetValidator.validated("")

        XCTAssertThrowsError(try validationResult.get())
    }

    func testShouldNotAcceptWrongCharacter() {
        let validationResult = alphabetValidator.validated("asd123")

        if case .failure(let error as AlphabetValidatorErrors) = validationResult {
            XCTAssertEqual(error, AlphabetValidatorErrors.invalidAlphabetCharacter)
        } else {
            XCTFail("should not accept alphanumeric")
        }
    }

    func testShouldAceeptCorrectCharacter() {
        let validationResult = alphabetValidator.validated("abc")

        if case .success(let date) = validationResult {
            XCTAssertEqual(date, "abc")
        } else {
            XCTFail("should accept valid characters")
        }
    }

}
