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
    // UI tests must launch the application that they test.
    let app = XCUIApplication()
    app.launch()
    
    //TODO
  }
  
  func test_item_can_be_removed_from_the_list() {
    // UI tests must launch the application that they test.
    let app = XCUIApplication()
    app.launch()
    
    //TODO
  }
}
