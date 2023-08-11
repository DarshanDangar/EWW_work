//
//  CategoriesCollCell.swift
//  Categories
//
//  Created by Darshan Dangar on 08/08/23.
//

import UIKit

class CategoriesCollCell: UICollectionViewCell {
    
    // Mark: Outlets
    @IBOutlet weak var lblCategoriesName: UILabel!
    @IBOutlet weak var vwCategories: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vwCategories.layer.cornerRadius = 30
    }
    
    // Mark: Config Cell
    func  configcell(data: CategoriesModel) {
        lblCategoriesName.text = data.categoriesName
    }


}
