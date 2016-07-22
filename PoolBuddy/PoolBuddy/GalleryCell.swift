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
    
    var searchImages: SearchImages!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(searchImages: SearchImages) {
        self.searchImages = searchImages
        
        galleryImages.image = UIImage(named: "\(self.searchImages.image)")
        imageLabel.text = self.searchImages.image.capitalizedString
    }
}
