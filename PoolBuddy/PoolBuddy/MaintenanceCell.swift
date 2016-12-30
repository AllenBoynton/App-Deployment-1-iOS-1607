//
//  MaintenanceCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/20/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class MaintenanceCell: UICollectionViewCell {
    
    // Outlets for collection view screen
    @IBOutlet weak var maintenanceImage: UIImageView!
    @IBOutlet weak var maintenanceLabel: UILabel!
    
    var poolData: PoolData!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 3.0
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    func configureCell(_ poolData: PoolData) {
        self.poolData = poolData
        
        maintenanceImage.image = UIImage(named: "\(self.poolData.image)")
        maintenanceLabel.text = self.poolData.label.capitalized
    }
}
