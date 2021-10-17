//
//  MealViewController.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/9/21.
//

import UIKit

class MealViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MealDelegate {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var model = SessionManager.shared
    var meals = [MealItem]()
    var category: CategoryItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        model.mealdelegate = self
        model.getMenu(category: category!.strCategory)
    }
    
    func mealsFetched(_ meals: [MealItem]) {
        self.meals = meals
        menuTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get a reference to the Category that was tapped on
        guard menuTableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedMeal = meals[menuTableView.indexPathForSelectedRow!.row]
        
        let menuVC = segue.destination as! MenuDetailViewController
        
        menuVC.meal = selectedMeal
        //menuVC.model = model
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }
    
    func setCell(_ cell: MealViewCell, _ meal: MealItem) {
        
        cell.meal = meal
        cell.mealName.text = meal.strMeal
        
        
        guard cell.meal?.strMealThumb != nil else {
            print("Category Image doesn't exist")
            return
        }
        
        
        if let imageData = model.imagecache.object(forKey: cell.meal!.strMealThumb as NSString) {
            print("using cache")
            DispatchQueue.main.async {
                cell.mealImage.image = imageData
            }
            
        }
        
        else {
            
            let url = URL(string: cell.meal!.strMealThumb)
            let session = URLSession.shared.dataTask(with: url!) { data, response, error in
                
                
                if error != nil {
                    let defaulticon = UIImage(systemName: "photo")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
                    DispatchQueue.main.async {
                        cell.mealImage.image = defaulticon
                    }
                }
                
                if error == nil && data != nil {
                    
                    let image = UIImage(data: data!)
                    //self.model.imagecache[cell.meal!.strMealThumb] = image
                    self.model.imagecache.setObject(image!, forKey: cell.meal!.strMealThumb as NSString)
                    DispatchQueue.main.async {
                        cell.mealImage.image = image
                    }
                    
                }
            }
            
            session.resume()
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.MENU_CELL_ID, for: indexPath) as! MealViewCell
        let meals = self.meals[indexPath.row]
        self.setCell(cell, meals)
        return cell
    }
    
}
