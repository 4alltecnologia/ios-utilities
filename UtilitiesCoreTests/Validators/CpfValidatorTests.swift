//
//  CpfValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Demetrius Martins Da Silva on 27/06/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class CpfValidatorTests: XCTestCase {
    var cpfValidator: ValidatorConvertible!

    override func setUp() {
        super.setUp()
        cpfValidator = ValidatorFactory.validatorFor(type: .cpf)
    }

    func testShouldNotAcceptEmptyValues() {
        let validateResult = cpfValidator.validated("")

        XCTAssertThrowsError(try validateResult.get())
    }

    func testShouldNotAcceptCpfMaskInvalid() {
        let validateResult = cpfValidator.validated("1478.32.9874/32")

        if case .failure(let error as CpfValidatorErrors) = validateResult {
            XCTAssertEqual(error, CpfValidatorErrors.invalidMaskCpfFormat)
        } else {
            XCTFail("validation should return error")
        }
    }

    func testShouldNotAcceptCpfInvalid() {
        let validateResult = cpfValidator.validated("111.111.111-11")

        if case .failure(let error as CpfValidatorErrors) = validateResult {
            XCTAssertEqual(error, CpfValidatorErrors.invalidCpf)
        } else {
            XCTFail("validation should return error")
        }
    }


    func testShouldAcceptCorrectCpf() {
        let validateResult = cpfValidator.validated("012.345.678-90")

        if case .success(let result) = validateResult {
            XCTAssertEqual(result, "012.345.678-90")
        } else {
            XCTFail("validation should pass")
        }
    }
}
