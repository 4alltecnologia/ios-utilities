//
//  DateTests.swift
//  UtilitiesCoreTests
//
//  Created by João Pedro De Souza Coutinho on 22/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class DateExtensionTests: XCTestCase {
    
    func testBrazilianElapsedInterval() {
        let nowDate = Date(timeIntervalSinceNow: 1)
        let nowElapse = "agora"
        XCTAssertEqual(nowDate.brazilianElapsedInterval, nowElapse)
        
        let hourDate = Date(timeIntervalSinceNow: -3 * 60 * 60)
        let hourElapse = "há 3 horas"
        XCTAssertEqual(hourDate.brazilianElapsedInterval, hourElapse)
        
        let dayDate = Date(timeIntervalSinceNow: -4 * 24 * 60 * 60)
        let dayElapse = "há 4 dias"
        XCTAssertEqual(dayDate.brazilianElapsedInterval, dayElapse)
        
        let monthDate = Date(timeIntervalSinceNow: -5 * 31 * 24 * 60 * 60)
        let monthElapse = "há 5 meses"
        XCTAssertEqual(monthDate.brazilianElapsedInterval, monthElapse)
        
        let yearDate = Date(timeIntervalSinceNow: -6 * 12 * 31 * 24 * 60 * 60)
        let yearElapse = "há 6 anos"
        XCTAssertEqual(yearDate.brazilianElapsedInterval, yearElapse)
    }
    
    func testGetString() {
        let timestamp = Date(timeIntervalSince1970: 784166400)
        let expectedResult = "06/11/1994 10:00:00"
        let dateString = timestamp.getString(withFormat: "dd/MM/yyyy hh:mm:ss")
        XCTAssertEqual(expectedResult, dateString)
    }
}
