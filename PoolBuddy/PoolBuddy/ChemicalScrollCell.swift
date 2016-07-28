//
//  ChemicalScrollCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/25/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class ChemicalScrollCell: UICollectionViewCell {
    
    // Outlets for collection view screen
    @IBOutlet weak var chemicalLabel: UILabel!
    @IBOutlet weak var chemicalImage: UIImageView!
    @IBOutlet weak var chemicalDescription: UITextView!
    
    var scrollData: PoolData!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(poolData: PoolData) {
        self.scrollData = poolData
        
        chemicalLabel.text = self.scrollData.label
        chemicalImage.image = UIImage(named: "\(self.scrollData.image)")
        chemicalDescription.text = self.scrollData.description
    }
}

