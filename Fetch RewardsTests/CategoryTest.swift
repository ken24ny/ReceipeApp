//
//  CategoryTest.swift
//  Fetch RewardsTests
//
//  Created by Kentaro Umemoto on 10/23/21.
//

import XCTest
@testable import Fetch_Rewards

class CategoryTest: XCTestCase {
    
    
    //test total amount of Categories fetched
    func testCategorySuccess() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Category data")
        let sessionmanager = SessionManager.shared
        var categories: [CategoryItem] = []
        
        
        sessionmanager.getData(url: Constants.CATEGORY_URL, id: "", type: Category.self) { result in
            switch result {
                
            case .success(let category):
                categories = category.categories!
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
                
                
            }
        }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(categories.count, 14)
    }
    
    //test name of Category fetched
    func testCategoryNameBeef() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Category Name")
        let sessionmanager = SessionManager.shared
        var categoryName:String = ""
        
        
        sessionmanager.getData(url: Constants.CATEGORY_URL, id: "", type: Category.self) { result in
            switch result {
                
            case .success(let category):
                categoryName = category.categories![0].strCategory
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
                
                
            }
        }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(categoryName, "Beef")
    }
    
    //test Image URL of Category fetched(Beef)
    func testCategoryDescriptionBeef() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Category Image URL")
        let sessionmanager = SessionManager.shared
        var categoryImageURL:String = ""
        
        
        sessionmanager.getData(url: Constants.CATEGORY_URL, id: "", type: Category.self) { result in
            switch result {
                
            case .success(let category):
                categoryImageURL = category.categories![0].strCategoryThumb
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
                
                
            }
        }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(categoryImageURL, "https://www.themealdb.com/images/category/beef.png")
    }
    

}


