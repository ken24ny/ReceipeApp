//
//  CategoryItem.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/8/21.
//

import Foundation

struct CategoryItem: Decodable {
    
    let strCategory: String
    let strCategoryThumb: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case strCategory
        case strCategoryThumb
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        self.strCategoryThumb = try container.decode(String.self, forKey: .strCategoryThumb)
    }
    
}
