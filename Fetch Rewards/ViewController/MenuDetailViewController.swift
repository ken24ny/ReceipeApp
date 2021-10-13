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
    
    
    var model = Model()
    var meal: MealItem?
    var mealdetail : MealDetailItem?
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
    
    //lazy var sessionManager = SessionManager()
    var datadetail : MealDetailItem?

    override func viewDidLoad() {
       super.viewDidLoad()
        model.fetchData(withID: meal!.idMeal){ [weak self] data in
         let decoder = JSONDecoder()
         do {
            let response = try decoder.decode(MealDetail.self, from: data)
            DispatchQueue.main.async {
                self?.mealdetail = response.meals![0]
                self?.instruction.text = self?.mealdetail!.strInstructions
            }
         } catch  {
           print(error.localizedDescription)
         }
      }
   }
   
    
    
    //        model.mealdetaildelegate = self
    //
    //        model.getMenuDetail(menuID: meal!.idMeal)
    //
    //
    //
    //
    //        self.mealName.text = meal!.strMeal
    //
    //        if mealdetail == nil {
    //            print("No menu detail available")
    //            return
    //        }
    //
    //        //self.mealImage.image = meal.
    //        print(mealdetail![0].strInstructions)
    //        self.instruction.text = mealdetail![0].strInstructions
    
    
    // Do any additional setup after loading the view.
}

//        override func viewWillAppear(_ animated: Bool) {
//
//            model.mealdetaildelegate = self
//
//            model.getMenuDetail(menuID: meal!.idMeal)
//
//            self.mealName.text = meal!.strMeal
//
//
//            if self.mealdetail == nil {
//                print("No menu detail available")
//                return
//            }
//
//            //self.mealImage.image = meal.
//            self.instruction.text = mealdetail![0].strInstructions
//        }
//
//
//    func mealdetailFetched(_ mealdetail: [MealDetailItem]) {
//        self.mealdetail = mealdetail
//        print(mealdetail)
//    }




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


