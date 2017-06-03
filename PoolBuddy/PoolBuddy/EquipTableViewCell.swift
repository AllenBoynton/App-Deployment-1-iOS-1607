//
//  EquipTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/2/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipTableViewCell: UITableViewCell {
    
    // Outlets for table view screen
    @IBOutlet weak var equipmentImage: UIImageView!
    @IBOutlet weak var equipmentLabel: UILabel!
    
    var poolData: PoolData!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(_ poolData: PoolData) {
        self.poolData = poolData
        
        equipmentImage.image = UIImage(named: "\(self.poolData.image)")
        equipmentLabel.text = self.poolData.label
    }
}
