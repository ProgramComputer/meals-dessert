//
//  mealsUITests.swift
//  mealsUITests
//
//  Created by Paul C on 11/14/23.
//

import XCTest

final class mealsUITests: XCTestCase {

    override func setUpWithError() throws {
      
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        let app = XCUIApplication()
//        app.launch()
//
//    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
