//
//  MealItem.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/9/21.
//

import Foundation


struct MealItem: Decodable {
    
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    enum CodingKeys: String, CodingKey {
        case strMeal
        case strMealThumb
        case idMeal
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
    }
    
}
