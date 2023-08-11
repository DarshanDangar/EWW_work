//
//  ViewController.swift
//  Categories
//
//  Created by Darshan Dangar on 08/08/23.
//

import UIKit

class CategoriesVC: UIViewController, TblHeaderDelegate {
    
    // Mark: Outlets
    @IBOutlet weak var tblCategories: UITableView!
    
    // Mark: Variables
    var listOfCategories = CategoriesModel.categoryList {
        didSet {
            tblCategories.reloadData()
        }
    }
    
    
    // Mark: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    // Mark: Initial SetUp
    private func initialSetUp() {
        tblCategories.delegate = self
        tblCategories.dataSource = self
        tblCategories.register(UINib(nibName: "CategoriesDatailsTblCell", bundle: nil), forCellReuseIdentifier: "CategoriesDatailsTblCell")
        tblCategories.register(UINib(nibName: "CategoriesNameHeaderTblCell", bundle: nil), forCellReuseIdentifier: "CategoriesNameHeaderTblCell")
        let tblHeader = Bundle.main.loadNibNamed("TblHeader", owner: nil)?.first as? TblHeader
        tblHeader?.collItemSelectDelegate = self
        tblCategories.tableHeaderView = tblHeader
    }

    func collItemTap(indexPath: IndexPath) {
        if indexPath.row == 0{
            listOfCategories = CategoriesModel.categoryList
        } else {
            listOfCategories = [CategoriesModel.categoryList[indexPath.row]]
        }
    }
    
}

// Mark: UITableView Delegate
extension CategoriesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// Mark: UITableView DataSource
extension CategoriesVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listOfCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesDatailsTblCell") as? CategoriesDatailsTblCell else {
            return UITableViewCell()
        }
//        if indexPath.section == 0 {
//            cell.isHidden = true
//        }
        cell.cateObj = listOfCategories[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesNameHeaderTblCell") as? CategoriesNameHeaderTblCell else {
            return UITableViewCell()
        }
//        if section == 0 {
//            cell.isHidden = true
//        }
        let dataforPerticularSection = listOfCategories[section]
        cell.configcell(data: dataforPerticularSection)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 0
//        } else {
//            return UITableView.automaticDimension
//        }
//    }
    
}


