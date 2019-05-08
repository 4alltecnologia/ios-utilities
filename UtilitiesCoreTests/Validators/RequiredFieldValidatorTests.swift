//
//  RequiredFieldValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 07/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class RequiredFieldValidatorTests: XCTestCase {
    var requiredFieldValidator: ValidatorConvertible!

    override func setUp() {
        super.setUp()

        requiredFieldValidator = ValidatorFactory.validatorFor(type: .requiredField(field: "test"))
    }

    func testShouldNotAcceptEmptyValues() {
        let validateResult = requiredFieldValidator.validated("")

        if case .failure(let error as RequiredFieldError) = validateResult {
            XCTAssertEqual(error, RequiredFieldError.fieldRequiredWith(name: "test"))
        } else {
            XCTFail("validation should return error")
        }
    }

    func testShouldAcceptNonEmptyValues() {
        let validateResult = requiredFieldValidator.validated("test")

        if case .success(let result) = validateResult {
            XCTAssertEqual(result, "test")
        } else {
            XCTFail("Não deve entrar nesse caso")
        }
    }
}
