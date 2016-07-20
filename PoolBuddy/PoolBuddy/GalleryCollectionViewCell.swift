//
//  GalleryCollectionViewCell.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImages: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var searchItems: SearchItems!
    
    func configureCell(searchItems: SearchItems) {
        self.searchItems = searchItems
        
        galleryImages.image = UIImage(named: "\(self.searchItems.imageName)")
        imageLabel.text = self.searchItems.imageName
    }
}
