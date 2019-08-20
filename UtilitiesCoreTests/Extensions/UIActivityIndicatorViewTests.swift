//
//  UIActivityIndicatorViewTests.swift
//  UtilitiesCoreTests
//
//  Created by Betina Pereira de Farias on 14/03/19.
//  Copyright © 2019 4all. All rights reserved.
//

import XCTest
@testable import UtilitiesCore

class UIActivityIndicatorViewTests: XCTestCase {

    var refreshControl: UIRefreshControl!
    var activity: UIActivityIndicatorView!
    
    override func setUp() {
        super.setUp()
        refreshControl = UIRefreshControl()
        refreshControl.endRefreshing()
        activity = UIActivityIndicatorView()
        activity.isHidden = true
        activity.stopAnimating()
    }

    override func tearDown() {
        super.tearDown()
        refreshControl = nil
        activity = nil
    }

    func testStartLoad() {
        // Testing with refresh control animating
        refreshControl.beginRefreshing()
        activity.startLoad(withRefreshControl: refreshControl)
        XCTAssertTrue(refreshControl.isRefreshing)
        XCTAssertTrue(activity.isHidden)
        XCTAssertFalse(activity.isAnimating)
        
        // Testing with refresh control not animating
        refreshControl.endRefreshing()
        activity.startLoad(withRefreshControl: refreshControl)
        XCTAssertFalse(refreshControl.isRefreshing)
        XCTAssertFalse(activity.isHidden)
        XCTAssertTrue(activity.isAnimating)
        
        // Testing without refresh control
        activity.startLoad()
        XCTAssertFalse(activity.isHidden)
        XCTAssertTrue(activity.isAnimating)
    }
    
    func testStopLoad() {
        // Testing with Refresh control animating
        refreshControl.beginRefreshing()
        activity.stopLoad(withRefreshControl: refreshControl)
        XCTAssertFalse(refreshControl.isRefreshing)
        XCTAssertTrue(activity.isHidden)
        XCTAssertFalse(activity.isAnimating)
        
        // Testing with Refresh control not animating
        refreshControl.endRefreshing()
        activity.startAnimating()
        activity.stopLoad(withRefreshControl: refreshControl)
        XCTAssertFalse(refreshControl.isRefreshing)
        XCTAssertTrue(activity.isHidden)
        XCTAssertFalse(activity.isAnimating)
        
        // Testing without refresh control
        activity.startAnimating()
        activity.stopLoad()
        XCTAssertTrue(activity.isHidden)
        XCTAssertFalse(activity.isAnimating)
    }
}
