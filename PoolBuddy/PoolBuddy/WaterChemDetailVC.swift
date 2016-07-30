//
//  WaterChemDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class WaterChemDetailVC: UIViewController {

    // Outlets for table view screen
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailText: UITextView!
    
    var detailTitle: String = ""
    var productImage: UIImage!
    var descriptions: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        detailImage.image = productImage
        detailText.text = descriptions
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }
}
