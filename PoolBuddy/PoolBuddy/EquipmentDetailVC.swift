//
//  EquipmentDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipmentDetailVC: UIViewController {
    
    @IBOutlet weak var equipmentImage: UIImageView!
    @IBOutlet weak var equipmentText: UITextView!
    
    
    var detailTitle: String = ""
    var productImage: UIImage!
    var descriptions: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        equipmentImage.image = productImage
        equipmentText.text = descriptions
        
        equipmentImage.layer.borderWidth = 2
        equipmentImage.layer.borderColor = UIColor.blackColor().CGColor
        
        equipmentText.layer.borderWidth = 2
        equipmentText.layer.borderColor = UIColor.blackColor().CGColor
    }
}
