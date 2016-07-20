//
//  CleaningToolsTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class CleaningToolsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var toolsImage: UIImageView!
    @IBOutlet weak var toolsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        toolsImage.layer.borderWidth = 2
        toolsImage.layer.borderColor = UIColor.blackColor().CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
