//
//  UIViewControllerTests.swift
//  UtilitiesCoreTests
//
//  Created by João Pedro De Souza Coutinho on 22/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class UIViewControllerTests: XCTestCase {

    func testRemoveBackButtonText() {
        let viewController = UIViewController()
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Button",
                                                                          style: .plain,
                                                                          target: viewController.self,
                                                                          action: nil)
        viewController.removeBackButtonText()
        
        XCTAssert(viewController.navigationItem.backBarButtonItem?.title == "")
    }
}
