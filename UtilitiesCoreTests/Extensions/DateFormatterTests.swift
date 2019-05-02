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
}
