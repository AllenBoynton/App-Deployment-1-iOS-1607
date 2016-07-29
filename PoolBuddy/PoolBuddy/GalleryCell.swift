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
    @IBOutlet weak var imageLabel: InsetLabel!
    
    var problems: Problems!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 3.0
        layer.borderWidth = 1
        layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func configureCell(problems: Problems) {
        self.problems = problems
        
        galleryImages.image = UIImage(named: "\(self.problems.image)")
        imageLabel.text = self.problems.title.capitalizedString
    }
}

class InsetLabel: UILabel {
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)))
    }
}
