//
//  GalleryDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class GalleryDetailVC: UIViewController {

    // Outlets for the text view & image of problem pool
    @IBOutlet weak var poolDescription: UITextView!
    @IBOutlet weak var poolImage: UIImageView!

    var detailTitle: String!
    var problemImage: UIImage!
    var descriptions: String!
    
    // Function is called to display the configure view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = detailTitle
        poolImage.image = problemImage
        poolDescription.text = descriptions
                
        poolImage.layer.cornerRadius = 4
        poolImage.layer.borderWidth = 2
        poolImage.layer.borderColor = UIColor.blackColor().CGColor
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }
}
