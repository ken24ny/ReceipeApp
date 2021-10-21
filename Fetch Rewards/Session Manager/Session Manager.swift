//
//  Session Manager.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/16/21.
//

import Foundation

import Foundation
import UIKit

protocol ModelDelegate {
    
    func categoriesFetched(_ categories:[CategoryItem])
}

protocol MealDelegate {
    
    func mealsFetched(_ meals:[MealItem])
}


class SessionManager {
    
    var delegate: ModelDelegate?
    var mealdelegate: MealDelegate?
    
    var imagecache:NSCache<NSString, UIImage>
    
    static let shared = SessionManager(cache: NSCache<NSString, UIImage>())
    
    private init(cache: NSCache<NSString, UIImage>) {
        self.imagecache = cache
    }
    
    func getCategory() {
        
        let url = URL(string: Constants.CATEGORY_URL)
        
        guard url != nil else {
            print("Invalid URL!")
            return
        }
        
        let session = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if error != nil && data == nil {
                print("There was a data retriving error!")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Category.self, from: data!)
                
                if response.categories != nil {
                    
                    let sortedCategories = response.categories!.sorted(by: { $0.strCategory < $1.strCategory })
                    
                    DispatchQueue.main.async {
                        self.delegate?.categoriesFetched(sortedCategories)
                    }
                    
                }
                
            } catch  {
                print(error.localizedDescription)
            }
            
            
        }
        
        session.resume()
        
    }
    
    
    func getMeal(category: String) {
        
        let url = URL(string: Constants.MEAL_URL + category)
        
        guard url != nil else {
            print("Invalid URL!")
            return
        }
        
        let session = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if error != nil && data == nil {
                print("There was a data retriving error!")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Meal.self, from: data!)
                
                if response.meals != nil {
                    
                    let sortedMeals = response.meals!.sorted(by: { $0.strMeal < $1.strMeal })
                    
                    DispatchQueue.main.async {
                        self.mealdelegate?.mealsFetched(sortedMeals)
                    }
                    
                }
            } catch  {
                print(error.localizedDescription)
            }
            
            
        }
        
        session.resume()
        
    }
    
    
    
    func getMealDetail(withID id: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: Constants.MEAL_DESCRIPTION_URL + id) else {
            print("Invalid URL!")
            return
        }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil, let data = data else {   //could be done far better by checking error and response codes
                print("There was a data retriving error!")
                return
            }
            
            completion(data)
        }
        session.resume()
    }
    
    
}
