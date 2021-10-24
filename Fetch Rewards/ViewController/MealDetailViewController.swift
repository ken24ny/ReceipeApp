//
//  MealDetailViewController.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/9/21.
//

import UIKit


class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var mealImage: UIImageView?
    @IBOutlet weak var mealName: UILabel?
    @IBOutlet weak var instruction: UITextView?
    
    var session = SessionManager.shared
    var meal: MealItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instruction!.isEditable = false
        instruction!.isScrollEnabled = false
        
        getMealDetail()
        setImage()
    }
    func setImage() {
        
        //default icon
        let defaulticon = UIImage(systemName: "photo")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        DispatchQueue.main.async {
            self.mealImage!.image = defaulticon
        }
        
        if let imageData = session.imagecache.object(forKey: meal!.strMealThumb as NSString) {
            
            print("using mealdetailitem cache")
            
            DispatchQueue.main.async {
                self.mealImage!.image = imageData
            }
        }
    }
    
    
    //fetch the meal detail data
    func getMealDetail() {
        session.getData(url: Constants.MEAL_DESCRIPTION_URL, id: meal!.idMeal, type: MealDetail.self) { result  in
            switch result {
            case .success(let response):
                let ingredients = (response.meals![0].strMeasure1 ?? "") + " " + (response.meals![0].strIngredient1 ?? "") + "\n" +
                (response.meals![0].strMeasure2 ?? "") + " " + (response.meals![0].strIngredient2 ?? "") + "\n" +
                (response.meals![0].strMeasure3 ?? "") + " " + (response.meals![0].strIngredient3 ?? "") + "\n" +
                (response.meals![0].strMeasure4 ?? "") + " " + (response.meals![0].strIngredient4 ?? "") + "\n" +
                (response.meals![0].strMeasure5 ?? "") + " " + (response.meals![0].strIngredient5 ?? "") + "\n" +
                (response.meals![0].strMeasure6 ?? "") + " " + (response.meals![0].strIngredient6 ?? "") + "\n" +
                (response.meals![0].strMeasure7 ?? "") + " " + (response.meals![0].strIngredient7 ?? "") + "\n" +
                (response.meals![0].strMeasure8 ?? "") + " " + (response.meals![0].strIngredient8 ?? "") + "\n" +
                (response.meals![0].strMeasure9 ?? "") + " " + (response.meals![0].strIngredient9 ?? "") + "\n" +
                (response.meals![0].strMeasure10 ?? "") + " " + (response.meals![0].strIngredient10 ?? "") + "\n" +
                (response.meals![0].strMeasure11 ?? "") + " " + (response.meals![0].strIngredient11 ?? "") + "\n" +
                (response.meals![0].strMeasure12 ?? "") + " " + (response.meals![0].strIngredient12 ?? "") + "\n" +
                (response.meals![0].strMeasure13 ?? "") + " " + (response.meals![0].strIngredient13 ?? "") + "\n" +
                (response.meals![0].strMeasure14 ?? "") + " " + (response.meals![0].strIngredient14 ?? "") + "\n" +
                (response.meals![0].strMeasure15 ?? "") + " " + (response.meals![0].strIngredient15 ?? "") + "\n" +
                (response.meals![0].strMeasure16 ?? "") + " " + (response.meals![0].strIngredient16 ?? "") + "\n" +
                (response.meals![0].strMeasure17 ?? "") + " " + (response.meals![0].strIngredient17 ?? "") + "\n" +
                (response.meals![0].strMeasure18 ?? "") + " " + (response.meals![0].strIngredient18 ?? "") + "\n" +
                (response.meals![0].strMeasure19 ?? "") + " " + (response.meals![0].strIngredient19 ?? "") + "\n" +
                (response.meals![0].strMeasure20 ?? "") + " " + (response.meals![0].strIngredient20 ?? "")
                
                let trimmedIngredients = ingredients.trimmingCharacters(in: .whitespacesAndNewlines)
                
                DispatchQueue.main.async {
                    
                    self.instruction!.text! = "Ingredients" +  "\n\n" + trimmedIngredients + "\n\n"
                    self.instruction!.text += "Instructions" +  "\n\n" + response.meals![0].strInstructions
                    self.mealName!.text = self.meal!.strMeal
                    
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
}
