//
//  EquipTableViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/2/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipTableViewCell: UITableViewCell {
    
    @IBOutlet weak var equipmentImage: UIImageView!
    @IBOutlet weak var equipmentLabel: UILabel!
    
    
    var searchImages: SearchImages!
    
    func configureCell(searchImages: SearchImages) {
        self.searchImages = searchImages
        
        equipmentImage.image = UIImage(named: "\(self.searchImages.image)")
        equipmentLabel.text = self.searchImages.image
    }
}
