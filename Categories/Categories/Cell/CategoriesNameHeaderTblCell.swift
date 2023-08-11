//
//  CategoriesNameHeaderTblCell.swift
//  Categories
//
//  Created by Darshan Dangar on 08/08/23.
//

import UIKit

class CategoriesNameHeaderTblCell: UITableViewCell {
    
    // Mark: Outlets
    @IBOutlet weak var imgCategories: UIImageView!
    @IBOutlet weak var lblCategoriesName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // Mark: Config Cell
    func  configcell(data: CategoriesModel) {
        imgCategories.image = UIImage(named: data.imgCategories)
        lblCategoriesName.text = data.categoriesName
        
        if data.imgCategories == "" {
            imgCategories.isHidden = true
        }
    }

    
}
