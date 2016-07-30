//
//  EquipmentDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipmentDetailVC: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailImage2: UIImageView!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var detailLabel: UILabel!
    
    var productTitle: String!
    var productImage: UIImage!
    var descriptions: String!
    var productLabel: String?
    var productImage2: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = productTitle
        detailImage.image = productImage
        detailText.text = descriptions
        
        if productLabel == "" || productImage2 == "" {
            detailLabel.hidden = true
            detailImage2.hidden = true
        } else {
            detailLabel.hidden = false
            detailImage2.hidden = false
            detailLabel.text = productLabel
            detailImage2.image = productImage2
        }
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }
}
