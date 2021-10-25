//
//  ErrorTests.swift
//  Fetch RewardsTests
//
//  Created by Kentaro Umemoto on 10/25/21.
//

import XCTest
@testable import Fetch_Rewards

class ErrorTests: XCTestCase {
    
    
    //test error case .badURL
    func testCategoryURLFailure() {
        let expectation = XCTestExpectation(description: "Testing Invalid URL")
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
        XCTAssertEqual(errorMessage, "Cannot be converted to a valid URL")
    }
    
    
    //test error case .url
    func testCategoryURLSessionFailure() {
        let expectation = XCTestExpectation(description: "Testing Invalid response")
        let sessionmanager = SessionManager.shared
        let invalidSessionURL: String = "https://www.invalidurl.com"
        var errorMessage: String = ""
        
        
        sessionmanager.getData(url: invalidSessionURL, id: "", type: Category.self) { result in
            switch result {
                
            case .success(_):
                XCTFail()
                
            case .failure(let error):
                errorMessage = error.localizedDescription
                expectation.fulfill()
                
            }
        }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(errorMessage, "URL Session error")
    }
    
    
    //test error case .badResponse
    func testCategoryStatusCodeFailure() {
        let expectation = XCTestExpectation(description: "Testing Invalid response")
        let sessionmanager = SessionManager.shared
        let invalidResponseURL: String = "https://www.amazon.com/error"
        var errorMessage: String = ""
        
        
        sessionmanager.getData(url: invalidResponseURL, id: "", type: Category.self) { result in
            switch result {
                
            case .success(_):
                XCTFail()
                
            case .failure(let error):
                errorMessage = error.localizedDescription
                expectation.fulfill()
                
            }
        }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(errorMessage, "Connection to the server failed")
    }
    
    //test error case .parsing
    func testParsingErrorFailure() {
        let expectation = XCTestExpectation(description: "Testing Invalid response")
        let sessionmanager = SessionManager.shared
        let parsingErrorURL: String = "https://jsonplaceholder.typicode.com/posts"
        var errorMessage: String = ""
        
        
        sessionmanager.getData(url: parsingErrorURL, id: "", type: Category.self) { result in
            switch result {
                
            case .success(_):
                XCTFail()
                
            case .failure(let error):
                errorMessage = error.localizedDescription
                expectation.fulfill()
                
            }
        }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(errorMessage, "Parsing error")
    }
    
}
