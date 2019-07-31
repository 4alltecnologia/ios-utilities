//
//  CustomValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 08/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class CustomValidatorTests: XCTestCase {
    var customValidator: ValidatorConvertible!

    enum CustomErrors: Error {
        case `default`
    }

    override func setUp() {
        super.setUp()
        customValidator = ValidatorFactory.validatorFor(type: .custom(validation: { (value) -> Result<String, Error> in
            guard value == "testeCustom" else {
                return .failure(CustomErrors.default)
            }
            return .success(value)
        }))
    }

    func testShouldNotAcceptWrongValue() {
        let validationResult = customValidator.validated("testeCustom12")

        if case .failure(let error as CustomErrors) = validationResult {
            XCTAssertEqual(error, CustomErrors.default)
        } else {
            XCTFail("should not accept wrong value")
        }
    }

    func testShouldAceeptCorrectValue() {
        let validationResult = customValidator.validated("testeCustom")

        if case .success(let date) = validationResult {
            XCTAssertEqual(date, "testeCustom")
        } else {
            XCTFail("should accept valid value")
        }
    }

}
