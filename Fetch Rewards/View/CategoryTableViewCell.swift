//
//  CategoryTableViewCell.swift
//  Fetch Rewards
//
//  Created by Kentaro Umemoto on 10/9/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var CategoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    var category: CategoryItem?
    
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
            self.CategoryImage.image = defaulticon
        }
        // Remove Subviews Or Layers That Were Added Just For This Cell
        
    }
}
