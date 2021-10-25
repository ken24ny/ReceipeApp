//
//  Fetch_RewardsUITests.swift
//  Fetch RewardsUITests
//
//  Created by Kentaro Umemoto on 9/27/21.
//

import XCTest

class Fetch_RewardsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

    }

    //check Category Header
    func testHeader1() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let categoryHeader = app.staticTexts["CategoryHeader"].label
        
        XCTAssertEqual(categoryHeader, "Categories")
    }
    
    //check Meals Header
    func testHeader2() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        let mealsHeader = app.staticTexts["MealsHeader"].label
        
        XCTAssertEqual(mealsHeader, "Meals")
    }
    
    
    //check number of rows for Category
    func testcountCategoryTable() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let totalCategory = XCUIApplication().tables["CategoryTable"].cells.count
        
        XCTAssertEqual(totalCategory, 14)
    }

    
    
    //test when user chooses Beef from the Category Table
    func testcountBeefMenu() {
        let app = XCUIApplication()
        app.launch()

        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()

        let totalBeefMenu = XCUIApplication().tables["MenuTable"].cells.count

        XCTAssertEqual(totalBeefMenu, 42)
    }
    
}
