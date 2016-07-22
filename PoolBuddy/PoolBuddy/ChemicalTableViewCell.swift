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
    
    
    var searchImages: SearchImages!
    
    func configureCell(searchImages: SearchImages) {
        self.searchImages = searchImages
        
        chemicalImage.image = UIImage(named: "\(self.searchImages.image)")
        chemicalLabel.text = self.searchImages.image
    }
}
