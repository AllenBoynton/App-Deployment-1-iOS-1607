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
    

    var searchImages: SearchImages!
    
    func configureCell(searchImages: SearchImages) {
        self.searchImages = searchImages
        
        toolsImage.image = UIImage(named: "\(self.searchImages.image)")
        toolsLabel.text = self.searchImages.image
    }

}
