//
//  CategoryItem.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/8/21.
//

import Foundation

struct CategoryItem: Decodable {
    
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    
    enum CodingKeys: String, CodingKey {
        case categories
        case idCategory
        case strCategory
        case strCategoryThumb
        case strCategoryDescription
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.idCategory = try container.decode(String.self, forKey: .idCategory)
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        self.strCategoryThumb = try container.decode(String.self, forKey: .strCategoryThumb)
        self.strCategoryDescription = try container.decode(String.self, forKey: .strCategoryDescription)
    }
    
}
