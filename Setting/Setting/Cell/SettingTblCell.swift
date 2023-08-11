//
//  SettingTblCell.swift
//  Setting
//
//  Created by Darshan Dangar on 03/08/23.
//

import UIKit

class SettingTblCell: UITableViewCell {
    
    // Mark: Outlets
    @IBOutlet weak var imgIteam: UIImageView!
    @IBOutlet weak var lblIteamName: UILabel!
    @IBOutlet weak var lblIteamSpecification: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Mark: Config Cell
    func  configcell(data: SettingModel) {
        imgIteam.image = UIImage(named: data.image ?? "apple")
        lblIteamName.text = data.name
    }
    
}
