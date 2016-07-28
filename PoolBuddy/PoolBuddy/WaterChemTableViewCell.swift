//
//  WaterChemTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class WaterChemTableViewCell: UITableViewCell {

    // Outlets for table view screen
    @IBOutlet weak var wChemistryImage: UIImageView!    
    @IBOutlet weak var wChemistryLabel: UILabel!
    
    var poolData: PoolData!
    
    func configureCell(poolData: PoolData) {
        self.poolData = poolData
        
        wChemistryImage.image = UIImage(named: "\(self.poolData.image)")
        wChemistryLabel.text = self.poolData.label
    }

}
