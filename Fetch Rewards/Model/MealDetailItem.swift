//
//  MealDetailItem.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/9/21.
//

import Foundation

struct MealDetailItem : Decodable {
    
    let strInstructions: String
    var strIngredient1 : String?
    let strIngredient2 : String?
    let strIngredient3 : String?
    let strIngredient4 : String?
    let strIngredient5 : String?
    let strIngredient6 : String?
    let strIngredient7 : String?
    let strIngredient8 : String?
    let strIngredient9 : String?
    let strIngredient10 : String?
    let strIngredient11 : String?
    let strIngredient12 : String?
    let strIngredient13 : String?
    let strIngredient14 : String?
    let strIngredient15 : String?
    let strIngredient16 : String?
    let strIngredient17 : String?
    let strIngredient18 : String?
    let strIngredient19 : String?
    let strIngredient20 : String?
    let strMeasure1 : String?
    let strMeasure2 : String?
    let strMeasure3 : String?
    let strMeasure4 : String?
    let strMeasure5 : String?
    let strMeasure6 : String?
    let strMeasure7 : String?
    let strMeasure8 : String?
    let strMeasure9 : String?
    let strMeasure10 : String?
    let strMeasure11 : String?
    let strMeasure12 : String?
    let strMeasure13 : String?
    let strMeasure14 : String?
    let strMeasure15 : String?
    let strMeasure16 : String?
    let strMeasure17 : String?
    let strMeasure18 : String?
    let strMeasure19 : String?
    let strMeasure20 : String?
    
    
    enum CodingKeys: String, CodingKey {
        case strInstructions
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
        
        self.strIngredient1 = try container.decodeIfPresent(String.self, forKey: .strIngredient1)?.emptyAsNil()
        self.strIngredient2 = try container.decodeIfPresent(String.self, forKey: .strIngredient2)?.emptyAsNil()
        self.strIngredient3 = try container.decodeIfPresent(String.self, forKey: .strIngredient3)?.emptyAsNil()
        self.strIngredient4 = try container.decodeIfPresent(String.self, forKey: .strIngredient4)?.emptyAsNil()
        self.strIngredient5 = try container.decodeIfPresent(String.self, forKey: .strIngredient5)?.emptyAsNil()
        self.strIngredient6 = try container.decodeIfPresent(String.self, forKey: .strIngredient6)?.emptyAsNil()
        self.strIngredient7 = try container.decodeIfPresent(String.self, forKey: .strIngredient7)?.emptyAsNil()
        self.strIngredient8 = try container.decodeIfPresent(String.self, forKey: .strIngredient8)?.emptyAsNil()
        self.strIngredient9 = try container.decodeIfPresent(String.self, forKey: .strIngredient9)?.emptyAsNil()
        self.strIngredient10 = try container.decodeIfPresent(String.self, forKey: .strIngredient10)?.emptyAsNil()
        self.strIngredient11 = try container.decodeIfPresent(String.self, forKey: .strIngredient11)?.emptyAsNil()
        self.strIngredient12 = try container.decodeIfPresent(String.self, forKey: .strIngredient12)?.emptyAsNil()
        self.strIngredient13 = try container.decodeIfPresent(String.self, forKey: .strIngredient13)?.emptyAsNil()
        self.strIngredient14 = try container.decodeIfPresent(String.self, forKey: .strIngredient14)?.emptyAsNil()
        self.strIngredient15 = try container.decodeIfPresent(String.self, forKey: .strIngredient15)?.emptyAsNil()
        self.strIngredient16 = try container.decodeIfPresent(String.self, forKey: .strIngredient16)?.emptyAsNil()
        self.strIngredient17 = try container.decodeIfPresent(String.self, forKey: .strIngredient17)?.emptyAsNil()
        self.strIngredient18 = try container.decodeIfPresent(String.self, forKey: .strIngredient18)?.emptyAsNil()
        self.strIngredient19 = try container.decodeIfPresent(String.self, forKey: .strIngredient19)?.emptyAsNil()
        self.strIngredient20 = try container.decodeIfPresent(String.self, forKey: .strIngredient20)?.emptyAsNil()
    
        self.strMeasure1 = try container.decodeIfPresent(String.self, forKey: .strMeasure1)?.emptyAsNil()
        self.strMeasure2 = try container.decodeIfPresent(String.self, forKey: .strMeasure2)?.emptyAsNil()
        self.strMeasure3 = try container.decodeIfPresent(String.self, forKey: .strMeasure3)?.emptyAsNil()
        self.strMeasure4 = try container.decodeIfPresent(String.self, forKey: .strMeasure4)?.emptyAsNil()
        self.strMeasure5 = try container.decodeIfPresent(String.self, forKey: .strMeasure5)?.emptyAsNil()
        self.strMeasure6 = try container.decodeIfPresent(String.self, forKey: .strMeasure6)?.emptyAsNil()
        self.strMeasure7 = try container.decodeIfPresent(String.self, forKey: .strMeasure7)?.emptyAsNil()
        self.strMeasure8 = try container.decodeIfPresent(String.self, forKey: .strMeasure8)?.emptyAsNil()
        self.strMeasure9 = try container.decodeIfPresent(String.self, forKey: .strMeasure9)?.emptyAsNil()
        self.strMeasure10 = try container.decodeIfPresent(String.self, forKey: .strMeasure10)?.emptyAsNil()
        self.strMeasure11 = try container.decodeIfPresent(String.self, forKey: .strMeasure11)?.emptyAsNil()
        self.strMeasure12 = try container.decodeIfPresent(String.self, forKey: .strMeasure12)?.emptyAsNil()
        self.strMeasure13 = try container.decodeIfPresent(String.self, forKey: .strMeasure13)?.emptyAsNil()
        self.strMeasure14 = try container.decodeIfPresent(String.self, forKey: .strMeasure14)?.emptyAsNil()
        self.strMeasure15 = try container.decodeIfPresent(String.self, forKey: .strMeasure15)?.emptyAsNil()
        self.strMeasure16 = try container.decodeIfPresent(String.self, forKey: .strMeasure16)?.emptyAsNil()
        self.strMeasure17 = try container.decodeIfPresent(String.self, forKey: .strMeasure17)?.emptyAsNil()
        self.strMeasure18 = try container.decodeIfPresent(String.self, forKey: .strMeasure18)?.emptyAsNil()
        self.strMeasure19 = try container.decodeIfPresent(String.self, forKey: .strMeasure19)?.emptyAsNil()
        self.strMeasure20 = try container.decodeIfPresent(String.self, forKey: .strMeasure20)?.emptyAsNil()
    }
}
