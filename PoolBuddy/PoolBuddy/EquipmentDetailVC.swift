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
    @IBOutlet weak var detailImage2: UIImageView?
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var detailLabel1: UILabel!
    @IBOutlet weak var detailLabel2: UILabel?
    
    var detailTitle: String = ""
    var productImage: UIImage!
    var descriptions: String = ""
    var detailLabel: String? = ""
    var productImage2: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        detailLabel1.text = detailTitle
        detailImage.image = productImage
        detailText.text = descriptions
        
        if detailLabel2 == "" || detailLabel2 == nil && detailImage2 == nil {
            detailLabel2!.hidden = true
            detailImage2!.hidden = true
        } else {
            detailLabel2!.hidden = false
            detailImage2!.hidden = false
            detailLabel2!.text = detailLabel
            detailImage2!.image = productImage2
        }
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }
}
