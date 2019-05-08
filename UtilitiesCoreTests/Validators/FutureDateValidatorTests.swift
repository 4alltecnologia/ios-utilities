//
//  FutureDateValidatorTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 08/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class FutureDateValidatorTests: XCTestCase {
    var futureDateValidator: ValidatorConvertible!
    var dateFormatter = DateFormatter.brazillianDateFormatWithoutTime

    override func setUp() {
        super.setUp()
        futureDateValidator = ValidatorFactory.validatorFor(type: .futureDate(dateFormatter: dateFormatter))
    }

    func testShouldNotAcceptEmptyValues() {
        let validationResult = futureDateValidator.validated("")

        XCTAssertThrowsError(try validationResult.get())
    }

    func testShouldNotAcceptPassedDates() {
        let now = Date()
        guard let passedDate = Calendar.current.date(byAdding: .day, value: -1, to: now) else {
            XCTFail("cannot create passed 1 day date")
            return
        }
        let validationResult = futureDateValidator.validated(dateFormatter.string(from: passedDate))

        if case .failure(let error as FutureDateValidatorErrors) = validationResult {
            XCTAssertEqual(error, FutureDateValidatorErrors.datePastThanToday)
        } else {
            XCTFail("should not accept valid dates")
        }
    }

    func testShouldAceeptFutureDates() {
        let now = Date()
        guard let longAgo = Calendar.current.date(byAdding: .day, value: 10, to: now) else {
            XCTFail("cannot create 10 days from today date")
            return
        }
        let dateString = dateFormatter.string(from: longAgo)
        let validationResult = futureDateValidator.validated(dateString)

        if case .success(let date) = validationResult {
            XCTAssertEqual(date, dateString)
        } else {
            XCTFail("should accept valid dates")
        }
    }
}
