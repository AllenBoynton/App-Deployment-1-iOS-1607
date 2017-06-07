//
//  MaintenanceDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/26/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class MaintenanceDetailVC: UIViewController {
    
    // Outlets for the text view & image of problem pool
    @IBOutlet weak var detailImage: UIImageView!    
    @IBOutlet weak var detailText: UITextView!
    
    var productTitle: String!
    var productImage = UIImage(named: "")
    var descriptions: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = productTitle
        detailImage.image = productImage
        detailText.text = descriptions
        
        detailText.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
    }
}
