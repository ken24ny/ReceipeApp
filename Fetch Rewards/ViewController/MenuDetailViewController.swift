//
//  MenuDetailViewController.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/9/21.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var instruction: UITextView!
    
    
    var model = SessionManager.shared
    var meal: MealItem?
    var mealdetail : MealDetailItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageData = model.imagecache[meal!.strMealThumb] {
            print("hitting the cache")
            
            DispatchQueue.main.async {
                self.mealImage.image = imageData
            }
            
        }
        
        
        model.fetchData(withID: meal!.idMeal){ [weak self] data in
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(MealDetail.self, from: data)
                DispatchQueue.main.async {
                    self?.mealdetail = response.meals![0]
                    self?.instruction.text = self?.mealdetail!.strInstructions
                    self?.mealName.text = self?.meal!.strMeal
                }
            } catch  {
                print(error.localizedDescription)
            }
        }
    }
    
}

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        model.fetchData(withID: meal!.idMeal){ [weak self] data in
//            let decoder = JSONDecoder()
//            do {
//                let response = try decoder.decode(MealDetail.self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.mealdetail = response.meals![0]
//                    self?.instruction.text = self?.mealdetail!.strInstructions
//                    self?.mealName.text = self?.meal!.strMeal
//                }
//
//            } catch  {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
