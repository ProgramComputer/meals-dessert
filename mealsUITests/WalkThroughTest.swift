//
//  WalkThrough.swift
//  mealsUITests
//
//  Created by Paul C on 11/14/23.
//

import XCTest

final class WalkThroughTest: XCTestCase {

    func testWalkthrough(){
        
        let app = XCUIApplication()
        app.launch()
        app.wait(for: .runningForeground, timeout: .pi)
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Apam balik"]/*[[".cells.buttons[\"Apam balik\"]",".buttons[\"Apam balik\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Apam balik").children(matching: .other).element.tap()
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Apam balik").element.swipeUp()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Meals"].tap()
        
        
        
      
        
        
    }
}
