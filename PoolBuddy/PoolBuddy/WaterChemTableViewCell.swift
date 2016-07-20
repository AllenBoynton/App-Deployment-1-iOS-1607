//
//  WaterChemTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class WaterChemTableViewCell: UITableViewCell {

    @IBOutlet weak var wChemistryImage: UIImageView!    
    @IBOutlet weak var wChemistryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        wChemistryImage.layer.borderWidth = 2
        wChemistryImage.layer.borderColor = UIColor.blackColor().CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
