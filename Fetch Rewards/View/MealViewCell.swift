//
//  MealViewCell.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/9/21.
//

import UIKit

class MealViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    
    var meal: MealItem?
    
    var model = Model()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ meal: MealItem) {
        self.meal = meal
        
        self.mealName.text = meal.strMeal
        
        guard self.meal?.strMealThumb != nil else {
            print("Category Image doesn't exist")
            return
        }
        
        let url = URL(string: self.meal!.strMealThumb)
        
        let session = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil {
                
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.mealImage.image = image
                }
        
            }
        }
        
        session.resume()
    }
    
    

}
