//
//  ValidAgeValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 07/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class ValidAgeValidatorTests: XCTestCase {
    var ageValidator: ValidatorConvertible!
    var dateFormatter = DateFormatter.brazillianDateFormatWithoutTime

    override func setUp() {
        super.setUp()
        ageValidator = ValidatorFactory.validatorFor(type: .validAge(dateFormatter: dateFormatter))
    }


    func testShouldNotAccepEmptyDates() {
        let validationResult = ageValidator.validated("")

        XCTAssertThrowsError(try validationResult.get())
    }

    func testShouldAcceptCorrectDates() {
        let now = Date()
        guard let longAgo = Calendar.current.date(byAdding: .year, value: -23, to: now) else {
            XCTFail("cannot create more than 141 years ago date")
            return
        }
        let dateString = dateFormatter.string(from: longAgo)
        let validationResult = ageValidator.validated(dateString)

        if case .success(let date) = validationResult {
            XCTAssertEqual(date, dateString)
        } else {
            XCTFail("should accept valid dates")
        }
    }

    func testShouldNotAcceptNonCorrectDates() {
        let validationResult = ageValidator.validated("1990-23-09")

        if case .failure(let error as ValidAgeValidatorErrors) = validationResult {
            XCTAssertEqual(error, ValidAgeValidatorErrors.invalidDateFormatt)
        } else {
            XCTFail("should accept valid dates")
        }
    }

    func testShouldNotAcceptBiggerThan140Years() {
        let now = Date()
        guard let longAgo = Calendar.current.date(byAdding: .year, value: -140, to: now) else {
            XCTFail("cannot create more than 141 years ago date")
            return
        }

        let validationResult = ageValidator.validated(dateFormatter.string(from: longAgo))

        if case .failure(let error as ValidAgeValidatorErrors) = validationResult {
            XCTAssertEqual(error, ValidAgeValidatorErrors.ageBiggerThan140Years)
        } else {
            XCTFail("should accept valid dates")
        }
    }

    func testShouldNotAceeptNegativeYears() {
        let now = Date()
        guard let futureDate = Calendar.current.date(byAdding: .year, value: 1, to: now) else {
            XCTFail("cannot create further 1 year date")
            return
        }
        let validationResult = ageValidator.validated(dateFormatter.string(from: futureDate))

        if case .failure(let error as ValidAgeValidatorErrors) = validationResult {
            XCTAssertEqual(error, ValidAgeValidatorErrors.ageShouldBeBiggerThan0)
        } else {
            XCTFail("should accept valid dates")
        }
    }

    func testShouldNotAceeptNegativeDays() {
        let now = Date()
        guard let futureDate = Calendar.current.date(byAdding: .day, value: 1, to: now) else {
            XCTFail("cannot create further 1 day date")
            return
        }
        let validationResult = ageValidator.validated(dateFormatter.string(from: futureDate))

        if case .failure(let error as ValidAgeValidatorErrors) = validationResult {
            XCTAssertEqual(error, ValidAgeValidatorErrors.ageShouldBeBiggerThan0)
        } else {
            XCTFail("should accept valid dates")
        }
    }
}
