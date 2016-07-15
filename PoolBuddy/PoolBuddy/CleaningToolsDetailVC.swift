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
    
    @IBOutlet weak var sideImage1: UIImageView!
    @IBOutlet weak var sideImage2: UIImageView!
    
    var detailTitle: String = ""
    var productImage: UIImage!
    var descriptions: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        cleaningImage.image = productImage
        cleaningText.text = descriptions
        
        
    }
}
