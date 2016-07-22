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
    
    
    var searchImages: SearchImages!
    
    func configureCell(searchImages: SearchImages) {
        self.searchImages = searchImages
        
        wChemistryImage.image = UIImage(named: "\(self.searchImages.image)")
        wChemistryLabel.text = self.searchImages.image
    }

}
