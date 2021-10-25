//
//  Constants.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/8/21.
//

import Foundation

// Constant static variables used thorughout the application
struct Constants {
    
    static var CATEGORY_URL = "https://www.themealdb.com/api/json/v1/1/categories.php"
    static var MEAL_URL = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    static var MEAL_DESCRIPTION_URL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    static var CATEGORYCELL_ID = "CategoryCell"
    static var MENU_CELL_ID = "MenuCell"
    static var CATEGORY_TABLE_ID = "CategoryTable"
    static var MENU_TABLE_ID = "MenuTable"
}
