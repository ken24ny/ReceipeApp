//
//  MealDetailTest.swift
//  Fetch RewardsTests
//
//  Created by Kentaro Umemoto on 10/25/21.
//

import XCTest
@testable import Fetch_Rewards

class MealDetailTest: XCTestCase {
    
    
    //test meal detail fetched from Beef Meal Detail
    func testBeefMealSuccess() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Beef Meal Detail data")
        let sessionmanager = SessionManager.shared
        var beefmealdetail: [MealDetailItem] = []
        
        
        sessionmanager.getData(url: Constants.MEAL_DESCRIPTION_URL, id: "52997", type: MealDetail.self) { result in
            switch result {
                
                case .success(let meal):
                beefmealdetail = meal.meals!
                expectation.fulfill()
                
                case .failure(let error):
                XCTFail(error.localizedDescription)
                    
                
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(beefmealdetail.count, 1)
        }
    
    
    //test meal instruction from Beef Meal Detail
    func testBeefMealInstruction() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Beef Meal Detail Instructions")
        let sessionmanager = SessionManager.shared
        var beefmealdetailinstruction: String = ""
        
        
        sessionmanager.getData(url: Constants.MEAL_DESCRIPTION_URL, id: "52997", type: MealDetail.self) { result in
            switch result {
                
                case .success(let meal):
                beefmealdetailinstruction = meal.meals![0].strInstructions
                expectation.fulfill()
                
                case .failure(let error):
                XCTFail(error.localizedDescription)
                    
                
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(beefmealdetailinstruction, "Add'l ingredients: mayonnaise, siracha\r\n\r\n1\r\n\r\nPlace rice in a fine-mesh sieve and rinse until water runs clear. Add to a small pot with 1 cup water (2 cups for 4 servings) and a pinch of salt. Bring to a boil, then cover and reduce heat to low. Cook until rice is tender, 15 minutes. Keep covered off heat for at least 10 minutes or until ready to serve.\r\n\r\n2\r\n\r\nMeanwhile, wash and dry all produce. Peel and finely chop garlic. Zest and quarter lime (for 4 servings, zest 1 lime and quarter both). Trim and halve cucumber lengthwise; thinly slice crosswise into half-moons. Halve, peel, and medium dice onion. Trim, peel, and grate carrot.\r\n\r\n3\r\n\r\nIn a medium bowl, combine cucumber, juice from half the lime, ¼ tsp sugar (½ tsp for 4 servings), and a pinch of salt. In a small bowl, combine mayonnaise, a pinch of garlic, a squeeze of lime juice, and as much sriracha as you’d like. Season with salt and pepper.\r\n\r\n4\r\n\r\nHeat a drizzle of oil in a large pan over medium-high heat. Add onion and cook, stirring, until softened, 4-5 minutes. Add beef, remaining garlic, and 2 tsp sugar (4 tsp for 4 servings). Cook, breaking up meat into pieces, until beef is browned and cooked through, 4-5 minutes. Stir in soy sauce. Turn off heat; taste and season with salt and pepper.\r\n\r\n5\r\n\r\nFluff rice with a fork; stir in lime zest and 1 TBSP butter. Divide rice between bowls. Arrange beef, grated carrot, and pickled cucumber on top. Top with a squeeze of lime juice. Drizzle with sriracha mayo.")
        }
    
    
    //test ingredient from Beef Meal Detail
    func testBeefMealIngredient() {
        let expectation = XCTestExpectation(description: "Testing Retrieving Beef Meal Ingredient 1")
        let sessionmanager = SessionManager.shared
        var beef_meal_detail_ingredient: String = ""
        
        
        sessionmanager.getData(url: Constants.MEAL_DESCRIPTION_URL, id: "52997", type: MealDetail.self) { result in
            switch result {
                
                case .success(let meal):
                beef_meal_detail_ingredient = meal.meals![0].strIngredient1!
                expectation.fulfill()
                
                case .failure(let error):
                XCTFail(error.localizedDescription)
                    
                
             }
            }
        
        wait(for: [expectation], timeout: 10)
        XCTAssertEqual(beef_meal_detail_ingredient, "Rice")
        }




}
