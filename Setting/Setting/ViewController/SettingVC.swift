//
//  SettingVC.swift
//  Setting
//
//  Created by Darshan Dangar on 03/08/23.
//

import UIKit

class SettingVC: UIViewController {
    
    // Mark: Outlets
    @IBOutlet weak var tblSetting: UITableView!
    
    // Mark: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Settings"
    }
    
    // Mark: Initial SetUp
    private func initialSetUp() {
        tblSetting.delegate = self
        tblSetting.dataSource = self
        tblSetting.register(UINib(nibName: "SettingTblCell", bundle: nil), forCellReuseIdentifier: "SettingTblCell")
    }
    
}

// Mark: UITableView Delegate
extension SettingVC: UITableViewDelegate {
    
}

// Mark: UITableView DataSource
extension SettingVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingModel.listOfSettingIteams.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return SettingModel.listOfSettingIteams["Section1"]?.count ?? 0
        case 1:
            return SettingModel.listOfSettingIteams["Section2"]?.count ?? 0
        case 2:
            return SettingModel.listOfSettingIteams["Section3"]?.count ?? 0
        case 3:
            return SettingModel.listOfSettingIteams["Section4"]?.count ?? 0
        case 4:
            return SettingModel.listOfSettingIteams["Section5"]?.count ?? 0
        case 5:
            return SettingModel.listOfSettingIteams["Section6"]?.count ?? 0
        case 6:
            return SettingModel.listOfSettingIteams["Section7"]?.count ?? 0
        case 7:
            return SettingModel.listOfSettingIteams["Section8"]?.count ?? 0
        case 8:
            return SettingModel.listOfSettingIteams["Section9"]?.count ?? 0
        case 9:
            return SettingModel.listOfSettingIteams["Section10"]?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTblCell") as? SettingTblCell else {
            return UITableViewCell()
        }
        switch indexPath.section {
        case 0:
            guard let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section1"]?[indexPath.row] else { return UITableViewCell() }
            cell.imgIteam.isHidden = true
            cell.configcell(data: dataOfParticularIndex)
        case 1:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section2"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        case 2:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section3"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        case 3:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section4"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        case 4:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section5"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        case 5:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section6"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        case 6:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section7"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        case 7:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section8"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        case 8:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section9"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        case 9:
            let dataOfParticularIndex = SettingModel.listOfSettingIteams["Section10"]?[indexPath.row] ?? SettingModel(image: "apple", name: "Apple")
            cell.configcell(data: dataOfParticularIndex)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customView = UIView()
        if section == 0 {
            return nil
        } else {
            return customView
        }
    }
    
}
