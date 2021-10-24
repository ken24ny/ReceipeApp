//
//  Fetch_RewardsUITests.swift
//  Fetch RewardsUITests
//
//  Created by Kentaro Umemoto on 9/27/21.
//

import XCTest

class Fetch_RewardsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

    }

    func testHeader1() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let categoryHeader = app.staticTexts["CategoryHeader"].label
        
        XCTAssertEqual(categoryHeader, "Categories")
    }
    
    func testHeader2() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        let mealsHeader = app.staticTexts["MealsHeader"].label
        
        XCTAssertEqual(mealsHeader, "Meals")
    }
    
    
    func testcountCategoryTable() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let totalCategory = XCUIApplication().tables.children(matching: .cell).count
        
        XCTAssertEqual(totalCategory, 14)
    }

    
    
//    func testcountBeefMenu() {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        app.tables.element(boundBy: 0).cells.element(boundBy: 1).tap()
//
//        let totalBeefMenu = XCUIApplication().tables.children(matching: .cell).count
//
//        XCTAssertEqual(totalBeefMenu, 42)
//    }
    
    
}
