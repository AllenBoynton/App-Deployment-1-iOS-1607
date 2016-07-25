//
//  EquipScrollCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/24/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipScrollCell: UICollectionViewCell {
    
    @IBOutlet weak var equipImage: UIImageView!
    @IBOutlet weak var equipLabel: UILabel!
    
    var poolData: PoolData!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(poolData: PoolData) {
        self.poolData = poolData
        
        equipImage.image = UIImage(named: "\(self.poolData.image)")
        equipLabel.text = self.poolData.label
    }
}
