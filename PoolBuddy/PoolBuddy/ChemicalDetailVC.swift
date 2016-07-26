//
//  ChemicalDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class ChemicalDetailVC: UIViewController {

    @IBOutlet weak var chemicalText: UITextView!
    @IBOutlet weak var chemicalImage: UIImageView!
    @IBOutlet weak var chemicalLabel: UITextView!
    @IBOutlet weak var chemicalImage2: UIImageView!
    
    
    var detailTitle: String = ""
    var detailLabel: String = ""
    var productImage: UIImage!
    var productImage2: UIImage!
    var descriptions: String = ""
    
    var strings:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        chemicalLabel?.text = detailLabel
        chemicalImage.image = productImage
        chemicalImage2?.image = productImage2
        chemicalText.text = descriptions
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }    
}
