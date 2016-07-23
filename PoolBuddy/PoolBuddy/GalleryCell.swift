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
    
    var data: ImageData!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
        layer.borderWidth = 2
        layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func configureCell(imageData: ImageData) {
        self.data = imageData
        
        galleryImages.image = UIImage(named: "\(self.data.image)")
        imageLabel.text = self.data.image.capitalizedString
    }
}

class InsetLabel: UILabel {
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)))
    }
}
