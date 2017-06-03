//
//  CategoryViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 6/2/17.
//  Copyright © 2017 Full Sail. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {

    // Outlets for table view screen
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var poolData: PoolData!
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    func configureCell(_ poolData: PoolData) {
        self.poolData = poolData
        
        categoryImage.image = UIImage(named: "\(self.poolData.image)")
        categoryLabel.text = self.poolData.label
    }

}
