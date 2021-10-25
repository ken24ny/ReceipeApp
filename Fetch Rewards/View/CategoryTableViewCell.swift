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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //set default image
    override func prepareForReuse() {
        super.prepareForReuse()
        
        let defaulticon = UIImage(systemName: "photo")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        DispatchQueue.main.async {
            self.CategoryImage.image = defaulticon
        }
        
    }
}
