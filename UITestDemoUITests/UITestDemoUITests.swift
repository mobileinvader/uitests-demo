//
//  UITestDemoUITests.swift
//  UITestDemoUITests
//
//  Created by Kristijan Kralj on 30/10/2019.
//  Copyright © 2019 Kristijan Kralj. All rights reserved.
//

import XCTest

class UITestDemoUITests: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
  }
  
  func test_item_can_be_added_to_the_list() {
    let app = XCUIApplication()
    app.launch()
    
    app.navigationBars["Things to do"].buttons["New Item"].tap()
    let todoItem = app.textFields["Enter name"]
    todoItem.tap()
    todoItem.typeText("Buy a house")
    app.buttons["Add"].tap()
    
    XCTAssertTrue(app.tables.staticTexts["Buy a house"].exists)
  }
  
  func test_item_can_be_removed_from_the_list() {
    let app = XCUIApplication()
    app.launch()

    let tablesQuery = XCUIApplication().tables
    let firstItem = tablesQuery.cells["Make cool app"].children(matching: .other).element(boundBy: 0)
    firstItem.swipeLeft()
    tablesQuery.buttons["Delete"].tap()

    XCTAssertFalse(app.tables.staticTexts["Make cool app"].exists)
  }
}
