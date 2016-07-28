//
//  ChemicalTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class ChemicalTableViewCell: UITableViewCell {

    // Outlets for table view screen
    @IBOutlet weak var chemicalImage: UIImageView!
    @IBOutlet weak var chemicalLabel: UILabel!
    
    var poolData: PoolData!
    
    func configureCell(poolData: PoolData) {
        self.poolData = poolData
        
        chemicalImage.image = UIImage(named: "\(self.poolData.image)")
        chemicalLabel.text = self.poolData.label
    }
}
