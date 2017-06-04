//
//  CleaningToolsTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class CleaningToolsTableViewCell: UITableViewCell {
    
    // Outlets for table view screen
    @IBOutlet weak var toolsImage: UIImageView!
    @IBOutlet weak var toolsLabel: UILabel!
    
    var poolData: PoolData!
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    func configureCell(_ poolData: PoolData) {
        self.poolData = poolData
        
        toolsImage.image = UIImage(named: "\(self.poolData.image)")
        toolsLabel.text = self.poolData.label
    }

}
