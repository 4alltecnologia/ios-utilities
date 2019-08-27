//
//  UIViewTests.swift
//  UtilitiesCoreTests
//
//  Created by Luca Saldanha Schifino on 20/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class TestView: UIView { }
class TestNib: UIView, NibInstantiatable { }

class UIViewTests: XCTestCase {

    func testViewExtensionMethods() {
        let contentView = UIView()
        let childView = TestView()
        contentView.addSubview(childView)
        XCTAssert(contentView.hasSubviewOf(type: TestView.self))
        
        let subview = contentView.getSubviewOf(type: TestView.self)
        XCTAssertNotNil(subview)
        
        contentView.removeSubviewOf(type: TestView.self)
        XCTAssertFalse(contentView.subviews.contains { $0 is TestView })
    }
    
    func testClassName() {
        let className = TestNib.instantiateFromNib(bundle: Bundle(for: TestNib.self))
        XCTAssertNotNil(className)
    }
}
