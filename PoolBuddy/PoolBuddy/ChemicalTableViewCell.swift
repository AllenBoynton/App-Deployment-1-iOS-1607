//
//  ChemicalTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class ChemicalTableViewCell: UITableViewCell {

    @IBOutlet weak var chemicalImage: UIImageView!
    @IBOutlet weak var chemicalLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)        
    }
}
