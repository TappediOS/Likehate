//
//  LikehateUITests.swift
//  LikehateUITests
//
//  Created by jun on 2019/09/27.
//  Copyright © 2019 jun. All rights reserved.
//

import XCTest

class LikehateUITests: XCTestCase {
   

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
      continueAfterFailure = true
      let app = XCUIApplication()
      setupSnapshot(app)
      app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
      let app = XCUIApplication()
      snapshot("light")
      app.launchArguments.append("darkmode")
      app.launch()
      snapshot("dark")
   
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
   
   func testLauncnView() {
      snapshot("LaunchView")
   }
   
   func testRegiView() {
      let app = XCUIApplication()
      app.buttons["RegiButton"].tap()
      snapshot("RegiView")
   }
   
   func testLikeView() {
      let app = XCUIApplication()
      app.buttons["RegiButton"].tap()
      app.buttons["seeLikeButton"].tap()
      snapshot("WriteLikeView")
   }
   
   func testHateView() {
      let app = XCUIApplication()
      app.buttons["RegiButton"].tap()
      app.buttons["seeLikeButton"].tap()
      snapshot("WriteLikeView")
   }
   
   func testWriteLikeView() {
      let app = XCUIApplication()
      app.buttons["RegiButton"].tap()
      app.buttons["seeLikeButton"].tap()
      
      let LikeTextField = app.textFields["LikeTextField"]
      LikeTextField.tap()
      LikeTextField.typeText("バンガン")
      snapshot("WriteLikeViewAndWrite")
      app.buttons["LikeRegiButton"].tap()
      snapshot("HartView")
      app.buttons["OKButton"].tap()
      snapshot("ReturnHomeView(Like)")
      
   }
   
   func testWriteHateView() {
      let app = XCUIApplication()
      app.buttons["RegiButton"].tap()
      app.buttons["seeHateButton"].tap()
      
      let HateTextField = app.textFields["HateTextField"]
      HateTextField.tap()
      HateTextField.typeText("タンスの隅っこ")
      snapshot("WriteHateViewAndWrite")
      app.buttons["HateRegiButton"].tap()

      snapshot("ReturnHomeView(Hate)")
      
   }
   
   func testChekSeeLikeView() {
      let app = XCUIApplication()
      app.buttons["GoLikeButton"].tap()
      snapshot("SeeLikeView")
   }
   
   func testChekSeeHateView() {
      let app = XCUIApplication()
      app.buttons["GoHateButton"].tap()
      snapshot("SeeLikeView")
   }
   
   func testDeleteLikeCell() {
      let app = XCUIApplication()
      app.buttons["GoLikeButton"].tap()
      
      snapshot("セルが削除される前(Like)")
      
      let cell = app.tables.cells.element(boundBy: 0)
      cell.swipeLeft()
      snapshot("セルが削除された後(Like)")
   }
   
   func testDeleteHateCell() {
      let app = XCUIApplication()
      app.buttons["GoHateButton"].tap()
      
      snapshot("セルが削除される前(Hate)")
      
      let cell = app.tables.cells.element(boundBy: 0)
      //cell.swipeLeft()
      snapshot("セルが削除された後(Hate)")
   }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
