//
//  EmailValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 07/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class EmailValidatorTests: XCTestCase {
    var emailValidator: ValidatorConvertible!

    override func setUp() {
        super.setUp()
        emailValidator = ValidatorFactory.validatorFor(type: .email)
    }

    func testShouldNotAcceptEmptyValues() {
        let validateResult = emailValidator.validated("")

        XCTAssertThrowsError(try validateResult.get())
    }

    func testShouldNotAcceptNonEmailValues() {
        let validateResult = emailValidator.validated("wdawda@qwe")

        if case .failure(let error as EmailValidatorErrors) = validateResult {
            XCTAssertEqual(error, EmailValidatorErrors.invalidEmailFormatt)
        } else {
            XCTFail("validation should return error")
        }
    }

    func testShouldAceeptCorrectEmail() {
        let validateResult = emailValidator.validated("test@test.com")

        if case .success(let result) = validateResult {
            XCTAssertEqual(result, "test@test.com")
        } else {
            XCTFail("validation should pass")
        }
    }
}
