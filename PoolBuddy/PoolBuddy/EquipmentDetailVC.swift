//
//  EquipmentDetailVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipmentDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Data Source
    
    // Gives us access to the pool product inventory info listed in PoolCategory
    lazy var poolEquipment: [PoolCategory] = {
        return PoolCategory.poolEquipment()
    }()
        
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    // Outlets for table view screen
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var equipmentImg: UIImageView!
    @IBOutlet weak var equipmentImg2: UIImageView!
    @IBOutlet weak var equipmentTxt: UITextView!
    @IBOutlet weak var equipmentLabel: UILabel!
    
    
    var detailTitle: String = ""
    var detailLabel: String = ""
    var productImage: UIImage!
    var productImage2: UIImage!
    var descriptions: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 800
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        equipmentLabel?.text = detailLabel
        equipmentImg.image = productImage
        equipmentImg2?.image = productImage2
        equipmentTxt.text = descriptions
        
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.blackColor().CGColor
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return poolEquipment.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let poolCategory = poolEquipment[section]
        return poolCategory.products.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("equipScrollCell", forIndexPath: indexPath) as! EquipScrollCell
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.blackColor().CGColor
//        
        let poolCategory = poolEquipment[indexPath.section]
        let product = poolCategory.products[indexPath.row]
        
        // Use collectionView to populate this details view
//        navigationItem.title = product.label
//        equipmentImg.image = UIImage(named: product.image)
//        equipmentTxt.text = product.description
        let scrollData = PoolData(label: product.label, image: product.image, label2: product.label2, image2: product.image2, description: product.description)
        cell.configureCell(scrollData)
        return cell
//        let poolData = PoolData(label: product.label, image: product.image, description: "")
//        cell.configureCell(poolData)
//        return cell
    }
}
