//
//  CleaningToolsDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class CleaningToolsDetailVC: UIViewController {
    
    @IBOutlet weak var cleaningImage: UIImageView!
    @IBOutlet weak var cleaningText: UITextView!
    
    
    var detailTitle: String = ""
    var productImage: UIImage!
    var descriptions: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        cleaningImage.image = productImage
        cleaningText.text = descriptions
        
        cleaningImage.layer.borderWidth = 2
        cleaningImage.layer.borderColor = UIColor.blackColor().CGColor
        
        cleaningText.layer.borderWidth = 2
        cleaningText.layer.borderColor = UIColor.blackColor().CGColor
    }
}
