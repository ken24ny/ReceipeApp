//
//  CategoryTest.swift
//  Fetch RewardsTests
//
//  Created by Kentaro Umemoto on 10/23/21.
//

import XCTest
@testable import Fetch_Rewards

class CategoryTest: XCTestCase {
    
    
    func testCategorySuccess() {
        let expectation = XCTestExpectation(description: "Testing Retriveing Category data")
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
    
    func testCategoryURLFailure() {
        let expectation = XCTestExpectation(description: "Testing Retriveing Category data")
        let sessionmanager = SessionManager.shared
        let invalidURL: String = "invalid.com/ this is a invalid URL"
        var errorMessage: String = ""
        
        
        sessionmanager.getData(url: invalidURL, id: "", type: Category.self) { result in
            switch result {
                
            case .success(_):
                XCTFail()
                
                case .failure(let error):
                errorMessage = error.localizedDescription
                expectation.fulfill()
    
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(errorMessage, "Somthing went wrong")
        }
     
    }
    

