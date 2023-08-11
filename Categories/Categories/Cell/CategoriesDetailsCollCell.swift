//
//  CategoriesDetailsCollCell.swift
//  Categories
//
//  Created by Darshan Dangar on 08/08/23.
//

import UIKit

class CategoriesDetailsCollCell: UICollectionViewCell {
    
    // Mark: Outlets
    @IBOutlet weak var imgCategoriesType: UIImageView!
    @IBOutlet weak var lblNameCategoriesType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Mark: Config Cell
    func  configcell(data: CategoriesModel?) {
        imgCategoriesType.image = UIImage(named: data?.imgCategories ?? "")
        lblNameCategoriesType.text = data?.categoriesName
    }

}
