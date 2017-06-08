//
//  EquipTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/2/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipTableViewCell: UITableViewCell {
    
    @IBOutlet weak var equipmentImage: UIImageView!
    @IBOutlet weak var equipmentLabel: UILabel!
    
    var poolData: PoolData!
    
    func configureCell(_ poolData: PoolData) {
        self.poolData = poolData
        
        equipmentImage.image = UIImage(named: "\(self.poolData.image)")
        equipmentLabel.text = self.poolData.label
    }
}
