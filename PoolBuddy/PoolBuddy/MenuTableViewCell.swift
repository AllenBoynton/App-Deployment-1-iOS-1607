//
//  MenuTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/1/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var menuImages: [UIImageView]!
    @IBOutlet var menuLabels: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
