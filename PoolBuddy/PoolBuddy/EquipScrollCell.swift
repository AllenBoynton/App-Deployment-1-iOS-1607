//
//  EquipScrollCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/24/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipScrollCell: UICollectionViewCell {
    
    // Outlets for collection view screen
    @IBOutlet weak var equipLabel: UILabel!
    @IBOutlet weak var equipImage: UIImageView!
    @IBOutlet weak var equipDescription: UITextView!
    
    var scrollData: PoolData!
        
    func configureCell(scrollData: PoolData) {
        self.scrollData = scrollData
        
        equipLabel.text = self.scrollData.label
        equipImage.image = UIImage(named: "\(self.scrollData.image)")
        equipDescription.text = self.scrollData.description
    }
}
