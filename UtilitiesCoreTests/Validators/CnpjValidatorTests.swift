//
//  CnpjValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Demetrius Martins Da Silva on 27/06/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class CnpjValidatorTests: XCTestCase {
    var cnpjValidator: ValidatorConvertible!

    override func setUp() {
        super.setUp()
        cnpjValidator = ValidatorFactory.validatorFor(type: .cnpj)
    }

    func testShouldNotAcceptEmptyValues() {
        let validateResult = cnpjValidator.validated("")

        XCTAssertThrowsError(try validateResult.get())
    }

    func testShouldNotAcceptCnpjMaskInvalid() {
        let validateResult = cnpjValidator.validated("148.32.9874/32-00000")

        if case .failure(let error as CnpjValidatorErrors) = validateResult {
            XCTAssertEqual(error, CnpjValidatorErrors.invalidMaskCnpjFormat)
        } else {
            XCTFail("validation should return error")
        }
    }

    func testShouldNotAcceptCnpjInvalid() {
        let validateResult = cnpjValidator.validated("11.111.111/1111-11")

        if case .failure(let error as CnpjValidatorErrors) = validateResult {
            XCTAssertEqual(error, CnpjValidatorErrors.invalidCnpj)
        } else {
            XCTFail("validation should return error")
        }
    }

    func testShouldAcceptCorrectCnpj() {
        let validateResult = cnpjValidator.validated("01.585.026/0001-01")

        if case .success(let result) = validateResult {
            XCTAssertEqual(result, "01.585.026/0001-01")
        } else {
            XCTFail("validation should pass")
        }
    }
}
