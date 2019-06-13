//
//  DateFormatterTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 02/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class DateFormatterTests: XCTestCase {

    func testCreateBrazilianDateFromString() {
        XCTAssertEqual(DateFormatter.brazillianDateFormatWithoutTime.dateFormat, "dd/MM/yyyy")

        let date = DateFormatter.brazillianDateFormatWithoutTime.date(from: "23/09/1990")

        guard let unDate = date else {
            XCTFail("error passing date with brazilian format")
            return
        }

        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: unDate)

        XCTAssertEqual(dateComponents.day, 23)
        XCTAssertEqual(dateComponents.month, 09)
        XCTAssertEqual(dateComponents.year, 1990)
    }

    func testIso8601CustomFormat() {
        let dateString = "2019-03-12T19:18:11.000Z"
        let date = Formatter.iso8601.date(from: dateString)

        let dateComponents = Calendar.current.dateComponents(in: TimeZone(abbreviation: "UTC")!, from: date!)

        XCTAssertEqual(dateComponents.day, 12)
        XCTAssertEqual(dateComponents.month, 03)
        XCTAssertEqual(dateComponents.year, 2019)
        XCTAssertEqual(dateComponents.hour, 19)
        XCTAssertEqual(dateComponents.minute, 18)
        XCTAssertEqual(dateComponents.second, 11)
    }
}
