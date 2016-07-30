//
//  ChemicalDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class ChemicalDetailVC: UIViewController {
    
    // Outlets for table view screen
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailLabel2: UILabel!
    @IBOutlet weak var detailImage2: UIImageView!
    
    var productTitle: String = ""
    var productImage: UIImage!
    var descriptions: String = ""
    var productLabel: String? = ""
    var productImage2: UIImage?
    
    var strings:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = productTitle
        detailImage.image = productImage
        detailImage2?.image = productImage2
        detailText.text = descriptions
        detailLabel2.text = productLabel
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }    
}
