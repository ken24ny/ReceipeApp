//
//  MealViewController.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/9/21.
//

import UIKit

class MealViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var session = SessionManager.shared
    var meals = [MealItem]()
    var category: CategoryItem?
    var errorMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        mealsFetched()
        
        menuTableView.accessibilityIdentifier = Constants.MENU_TABLE_ID
    }
    
    
    //fetch the Meal data and load the data into the view
    func mealsFetched() {
        
        self.errorMessage = nil
        
        session.getData(url: Constants.MEAL_URL, id: category!.strCategory, type: Meal.self) { [unowned self] result in
            
            switch result {
            case .success(let response):
                
                
                if response.meals != nil {
                    
                    let sortedMeals = response.meals!.sorted(by: { $0.strMeal < $1.strMeal })
                    self.meals = sortedMeals
                    self.menuTableView.reloadData()
                    
                    
                }
            case .failure(let err):
                self.errorMessage = err.localizedDescription
                
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get a reference to the Category that was tapped on
        guard menuTableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedMeal = meals[menuTableView.indexPathForSelectedRow!.row]
        
        let menuVC = segue.destination as! MealDetailViewController
        
        menuVC.meal = selectedMeal
    }
    

    func setCell(_ cell: MealViewCell, _ meal: MealItem) {
        
        cell.meal = meal
        cell.mealName.text = meal.strMeal
        
        
        guard let url = URL(string: cell.meal!.strMealThumb) else {
            return
        }
        
        
        if let imageData = session.imagecache.object(forKey: cell.meal!.strMealThumb as NSString) {
            DispatchQueue.main.async {
                cell.mealImage.image = imageData
            }
            
        }
        
        else {

            let session = URLSession.shared.dataTask(with: url) { data, response, error in
                
                //default image
                if error != nil {
                    let defaulticon = UIImage(systemName: "photo")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
                    DispatchQueue.main.async {
                        cell.mealImage.image = defaulticon
                    }
                }
                
                if error == nil && data != nil {
                    
                    let image = UIImage(data: data!)
                    self.session.imagecache.setObject(image!, forKey: cell.meal!.strMealThumb as NSString)
                    DispatchQueue.main.async {
                        cell.mealImage.image = image
                    }
                }
            }
            session.resume()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.MENU_CELL_ID, for: indexPath) as! MealViewCell
        let meals = self.meals[indexPath.row]
        self.setCell(cell, meals)
        return cell
    }
    
}
