//
//  CategoriesDatailsTblCell.swift
//  Categories
//
//  Created by Darshan Dangar on 08/08/23.
//

import UIKit

class CategoriesDatailsTblCell: UITableViewCell {
    
    // Mark: Outlets
    @IBOutlet weak var collCategoriesDetails: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!
    
    // Mark: Variables
    var cateObj: CategoriesModel? {
        didSet {
            collCategoriesDetails.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    // Mark: Initial SetUp
    private func initialSetUp() {
        collCategoriesDetails.delegate = self
        collCategoriesDetails.dataSource = self
        collCategoriesDetails.register(UINib(nibName: "CategoriesDetailsCollCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesDetailsCollCell")
        collCategoriesDetails.register(UINib(nibName: "CategoriesCollCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollCell")
    }
    
}

// Mark: UICollectionView DataSource
extension CategoriesDatailsTblCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(index)
        return cateObj?.subList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesDetailsCollCell", for: indexPath) as? CategoriesDetailsCollCell else {
            return UICollectionViewCell()
        }
        let dataForPerticularIndex = cateObj?.subList[indexPath.row]
        cell.configcell(data: dataForPerticularIndex)
        return cell
    }
    
}



// Mark: UICollectionView Delegates
extension CategoriesDatailsTblCell: UICollectionViewDelegate {
    
}

// Mark: UICollectionView DataFlowLayout
extension CategoriesDetailsCollCell: UICollectionViewDelegateFlowLayout {

}
