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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        let defaulticon = UIImage(systemName: "photo")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        DispatchQueue.main.async {
            self.mealImage.image = defaulticon
        }
        // Remove Subviews Or Layers That Were Added Just For This Cell
        
    }
    
}
