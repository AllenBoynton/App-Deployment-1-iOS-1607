//
//  WChemistryTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class WChemistryTableViewCell: UITableViewCell {

    @IBOutlet weak var wChemistryImage: UIImageView!
    
    @IBOutlet weak var wChemistryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
