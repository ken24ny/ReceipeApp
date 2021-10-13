//
//  ViewController.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 9/27/21.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var categories = [CategoryItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getCategory()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get a reference to the Category that was tapped on
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedCategory = categories[tableView.indexPathForSelectedRow!.row]
        
        let mealVC = segue.destination as! MealViewController
        
        mealVC.category = selectedCategory
    }
    
    func categoriesFetched(_ categories: [CategoryItem]) {
        self.categories = categories
        tableView.reloadData()
    }
    
    //TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CATEGORYCELL_ID, for: indexPath) as! CategoryTableViewCell
        
        
        let category = self.categories[indexPath.row]
        
        cell.setCell(category)
        
        
        return cell
    }
    
    
    
    
    


}

