//
//  CleaningToolsDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class CleaningToolsDetailVC: UIViewController {
    
    lazy var maintenanceEquipment: [PoolCategory] = {
        return PoolCategory.maintenanceEquipment()
    }()
    
    // Outlets for the text view & image of problem pool
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var detailImage2: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    var detailTitle: String = ""
    var detailLabel: String = ""
    var productImage: UIImage!
    var productImage2: UIImage!
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
