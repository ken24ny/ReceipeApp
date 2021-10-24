//
//  MealTest.swift
//  Fetch RewardsTests
//
//  Created by Kentaro Umemoto on 10/24/21.
//

import XCTest
@testable import Fetch_Rewards

class MealTest: XCTestCase {

    func testBeefMealSuccess() {
        let expectation = XCTestExpectation(description: "Testing Retriveing Beef Meal data")
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
    
    func testBreakfastMealSuccess() {
        let expectation = XCTestExpectation(description: "Testing Retriveing Breakfast Meal data")
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
}
