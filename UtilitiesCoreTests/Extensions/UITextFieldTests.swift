//
//  UITextFieldTests.swift
//  UtilitiesCoreTests
//
//  Created by Felipe Dias Pereira on 08/05/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class UITextFieldTests: XCTestCase {
    var field: UITextField!

    override func setUp() {
        super.setUp()
        field = UITextField(frame: .zero)
    }

    func testShouldAcceptNonEmptyValues() {
        field.text = "Result"

        let validationResult = field.validatedText(validationType: .requiredField(field: "Teste Field"))

        if case .success(let value) = validationResult {
            XCTAssertEqual(value, "Result")
        } else {
            XCTFail("should pass validation on empty field")
        }
    }

    func testShouldNotAcceptEmptyValues() {
        let validationResult = field.validatedText(validationType: .requiredField(field: "Teste Field"))

        XCTAssertThrowsError(try validationResult.get())
    }

}
