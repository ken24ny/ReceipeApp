//
//  model.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/8/21.
//

import Foundation
import UIKit

protocol ModelDelegate {
    
    func categoriesFetched(_ categories:[CategoryItem])
}

protocol MealDelegate {
    
    func mealsFetched(_ meals:[MealItem])
}

protocol MealDetailDelegate {
    
    func mealdetailFetched(_ mealdetail: [MealDetailItem])
}

class Model {
    
    var delegate: ModelDelegate?
    var mealdelegate: MealDelegate?
    var mealdetaildelegate: MealDetailDelegate?
    
    var imagecache: [String: UIImage] = [:]
    var cache = NSCache<NSString, NSData>()
    
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
                
                
               // dump(response.categories![0])
            } catch  {
                print(error.localizedDescription)
            }
            
            
        }
        
        session.resume()
        
    }
    
    
    func getMenu(category: String) {
        
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
                
                //dump(response.meals![0])
            } catch  {
                print(error.localizedDescription)
            }
            
            
        }
        
        session.resume()
        
    }
    
    func fetchData(withID id: String, completion: @escaping (Data) -> Void) {
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
    
//    func getMenuDetail(menuID: String) {
//
//        let url = URL(string: Constants.MEAL_DESCRIPTION_URL + menuID)
//        print(Constants.MEAL_DESCRIPTION_URL + menuID)
//
//        guard url != nil else {
//            print("Invalid URL!")
//            return
//        }
        
//        let session = URLSession.shared.dataTask(with: url!) { data, response, error in
//
//            if error != nil && data == nil {
//                print("There was a data retriving error!")
//                return
//            }
//
//            let decoder = JSONDecoder()
//
//            do {
//                let response = try decoder.decode(MealDetail.self, from: data!)
//
//                if response.meals != nil {
//
//                    DispatchQueue.main.async {
//
//                        self.mealdetaildelegate?.mealdetailFetched(response.meals!)
//                    }
//
//                }
//
//            } catch  {
//                print(error.localizedDescription)
//            }
//
//
//        }
//
//        session.resume()
//
//    }
    
    
    
    
}
