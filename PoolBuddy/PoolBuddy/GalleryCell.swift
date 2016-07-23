//
//  GalleryCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImages: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var imageData: ImageData!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        layer.borderWidth = 2
        layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func configureCell(imageData: ImageData) {
        self.imageData = imageData
        
        galleryImages.image = UIImage(named: "\(self.imageData.image)")
        imageLabel.text = self.imageData.image.capitalizedString
    }
}
