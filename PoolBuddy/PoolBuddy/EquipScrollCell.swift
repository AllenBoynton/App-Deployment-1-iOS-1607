//
//  EquipScrollCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/24/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipScrollCell: UICollectionViewCell {
    
    @IBOutlet weak var equipLabel: UILabel!
    @IBOutlet weak var equipImage: UIImageView!
    @IBOutlet weak var equipDescription: UITextView!
    
    var scrollData: PoolData!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(poolData: PoolData) {
        self.scrollData = poolData
        
        equipLabel.text = self.scrollData.label
        equipImage.image = UIImage(named: "\(self.scrollData.image)")
        equipDescription.text = self.scrollData.description
    }
}
