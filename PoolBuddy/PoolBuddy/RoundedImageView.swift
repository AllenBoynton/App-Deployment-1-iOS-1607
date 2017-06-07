//
//  RoundedImageView.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 6/5/17.
//  Copyright © 2017 Full Sail. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    
    // Creates rounded buttons for choice buttons
    override func awakeFromNib() {
        self.layer.cornerRadius = 3.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1.0).cgColor
        self.clipsToBounds = true
    }
}
