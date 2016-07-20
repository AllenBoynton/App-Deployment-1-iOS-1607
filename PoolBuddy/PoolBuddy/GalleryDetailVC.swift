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
    
    
    // DataSource for details in this VC
    var poolDetail: SearchItems? {
        didSet {
            configureView()
        }
    }
    
    // Assigns the segue delegate to the view and image of this VC
    func configureView() {
        if let poolDetail = poolDetail {
            if let poolDescription = poolDescription, poolImage = poolImage {
                poolDescription.text = poolDetail.imageName
                poolImage.image = UIImage(named: poolDetail.imageName)
                navigationItem.title = poolDetail.imageName
            }
        }
    }
    
    // Function is called to display the configure view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        poolImage.layer.borderWidth = 2
        poolImage.layer.borderColor = UIColor.blackColor().CGColor
        
        poolDescription.layer.borderWidth = 2
        poolDescription.layer.borderColor = UIColor.blackColor().CGColor
    }
}
