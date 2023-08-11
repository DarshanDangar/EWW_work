//
//  vwCategoriesHeader.swift
//  Categories
//
//  Created by Darshan Dangar on 09/08/23.
//

import UIKit

class TblHeader: UITableViewHeaderFooterView {

    // Mark: Outlets
    @IBOutlet weak var collTblHeader: UICollectionView!
    
    // Mark: Variables
    weak var collItemSelectDelegate: TblHeaderDelegate?
    
    override func awakeFromNib() {
        initialSetUp()
    }
    
    // Mark: Initial SetUp
    private func initialSetUp() {
        collTblHeader.delegate = self
        collTblHeader.dataSource = self
        collTblHeader.register(UINib(nibName: "CategoriesCollCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollCell")
    }

}

// Mark: UICollectionView DataSource
extension TblHeader: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoriesModel.categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollCell", for: indexPath) as? CategoriesCollCell else {
            return UICollectionViewCell()
        }
        let indexData = CategoriesModel.categoryList[indexPath.row]
        cell.configcell(data: indexData)
        return cell
    }
    
}

// Mark: UICollectionView Delegates
extension TblHeader: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collItemSelectDelegate?.collItemTap(indexPath: indexPath)
    }
}

protocol TblHeaderDelegate: AnyObject {
    func collItemTap(indexPath: IndexPath)
}

