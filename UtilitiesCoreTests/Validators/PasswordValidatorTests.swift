//
//  PasswordValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 08/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class PasswordValidatorTests: XCTestCase {
    var passwordValidator: ValidatorConvertible!

    override func setUp() {
        super.setUp()
        passwordValidator = ValidatorFactory.validatorFor(type: .password)
    }

    func testShouldNotAcceptEmptyValues() {
        let validationResult = passwordValidator.validated("")

        XCTAssertThrowsError(try validationResult.get())
    }

    func testPasswordShouldNotAcceptWrongPassword() {
        let validationResult = passwordValidator.validated("12345")

        if case .failure(let error as PasswordValidatorErrors) = validationResult {
            XCTAssertEqual(error, PasswordValidatorErrors.invalidPassword)
        } else {
            XCTFail("should accept valid dates")
        }
    }

    func testShouldAceeptCorrectPassword() {
        let validationResult = passwordValidator.validated("abc123456")

        if case .success(let date) = validationResult {
            XCTAssertEqual(date, "abc123456")
        } else {
            XCTFail("should accept valid dates")
        }
    }
}
