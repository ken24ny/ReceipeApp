//
//  MealTest.swift
//  Fetch RewardsTests
//
//  Created by Kentaro Umemoto on 10/24/21.
//

import XCTest
@testable import Fetch_Rewards

class MealTest: XCTestCase {

    //test meals from Beef Category
    func testBeefMealSuccess() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Beef Meal data")
        let sessionmanager = SessionManager.shared
        var beefmeals: [MealItem] = []
        
        
        sessionmanager.getData(url: Constants.MEAL_URL, id: "BEEF", type: Meal.self) { result in
            switch result {
                
                case .success(let meal):
                beefmeals = meal.meals!
                expectation.fulfill()
                
                case .failure(let error):
                XCTFail(error.localizedDescription)
                    
                
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(beefmeals.count, 42)
        }
    
    //test meals from Breakfast Category
    func testBreakfastMealSuccess() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Breakfast Meal data")
        let sessionmanager = SessionManager.shared
        var breakfastmeals: [MealItem] = []
        
        
        sessionmanager.getData(url: Constants.MEAL_URL, id: "Breakfast", type: Meal.self) { result in
            switch result {
                
                case .success(let meal):
                breakfastmeals = meal.meals!
                expectation.fulfill()
                
                case .failure(let error):
                XCTFail(error.localizedDescription)
                    
                
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(breakfastmeals.count, 7)
        }
    
    //test meal name from Beef Category
    func testBeefMealName() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Beef Meal data")
        let sessionmanager = SessionManager.shared
        var beefMeal1: String = ""
        
        
        sessionmanager.getData(url: Constants.MEAL_URL, id: "Beef", type: Meal.self) { result in
            switch result {
                
                case .success(let meal):
                beefMeal1 = meal.meals![0].strMeal
                expectation.fulfill()
                
                case .failure(let error):
                XCTFail(error.localizedDescription)
                    
                
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(beefMeal1, "Beef and Mustard Pie")
        }
    
    
    //test meal id from Beef Category
    func testBeefMealID() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Beef and Mustard Pie ID")
        let sessionmanager = SessionManager.shared
        var beefMeal1ID: String = ""
        
        
        sessionmanager.getData(url: Constants.MEAL_URL, id: "Beef", type: Meal.self) { result in
            switch result {
                
                case .success(let meal):
                beefMeal1ID = meal.meals![0].idMeal
                expectation.fulfill()
                
                case .failure(let error):
                XCTFail(error.localizedDescription)
                    
                
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(beefMeal1ID, "52874")
        }
    
    //test meal image URL from Beef Category 
    func testBeefMealImageURL() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Beef and Mustard Pie Image URL")
        let sessionmanager = SessionManager.shared
        var beefMeal1ImageURL: String = ""
        
        
        sessionmanager.getData(url: Constants.MEAL_URL, id: "Beef", type: Meal.self) { result in
            switch result {
                
                case .success(let meal):
                beefMeal1ImageURL = meal.meals![0].strMealThumb
                expectation.fulfill()
                
                case .failure(let error):
                XCTFail(error.localizedDescription)
                    
                
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(beefMeal1ImageURL, "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")
        }
    
}
