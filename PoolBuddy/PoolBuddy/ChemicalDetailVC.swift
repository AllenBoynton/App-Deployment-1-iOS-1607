//
//  ChemicalDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class ChemicalDetailVC: UIViewController {
    
    lazy var poolChemicals: [PoolCategory] = {
        return PoolCategory.poolChemicals()
    }()

    // Outlets for table view screen
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailLabel: UITextView!
    @IBOutlet weak var detailImage2: UIImageView!
    
    var detailTitle: String = ""
    var detailLabel2: String = ""
    var productImage: UIImage!
    var productImage2: UIImage!
    var descriptions: String = ""
    
    var strings:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        detailLabel?.text = detailLabel2
        detailImage.image = productImage
        detailImage2?.image = productImage2
        detailText.text = descriptions
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }    
}
