//
//  ViewController.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 9/27/21.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var model = SessionManager.shared
    var categories = [CategoryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getCategory()
        
        title = "Haha"
        
        
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
    
    func setCell(_ cell: CategoryTableViewCell, _ category: CategoryItem) {
        cell.category = category
        cell.categoryName.text = category.strCategory
        
        guard cell.category?.strCategoryThumb != nil else {
            print("Category Image doesn't exist")
            return
        }
        
        if let imageData = model.imagecache.object(forKey: cell.category!.strCategoryThumb as NSString) {
            print("using cache")
            DispatchQueue.main.async {
                cell.CategoryImage.image = imageData
            }
            
        }
        
        else {
            
            let url = URL(string: cell.category!.strCategoryThumb)
            
            let session = URLSession.shared.dataTask(with: url!) { data, response, error in
                
                if error != nil {
                    print("cannot load view")
                    
                    let defaulticon = UIImage(systemName: "photo")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
                    DispatchQueue.main.async {
                        cell.CategoryImage.image = defaulticon
                    }
                    
                }
                
                if error == nil && data != nil {
                    
                    let image = UIImage(data: data!)
                    self.model.imagecache.setObject(image!, forKey: cell.category!.strCategoryThumb as NSString)
                    DispatchQueue.main.async {
                        cell.CategoryImage.image = image
                    }
                }
            }
            
            session.resume()
        }
        
    }
    
    
    //TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CATEGORYCELL_ID, for: indexPath) as! CategoryTableViewCell
        let category = self.categories[indexPath.row]
        
        self.setCell(cell,category)
        
        
        return cell
    }
    
}




