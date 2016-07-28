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
    
    // Outlets to create scroll view
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    // Outlets for table view screen
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailImage2: UIImageView?
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var detailLabel: UILabel?
    
    var detailTitle: String = ""
    var productImage: UIImage!
    var descriptions: String = ""
    var detailLabel2: String? = ""
    var productImage2: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize.height = 1000
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        detailImage.image = productImage
        detailText.text = descriptions
        
        if detailLabel == "" || detailLabel == nil && detailImage2 == nil {
            detailLabel!.hidden = true
            detailImage2!.hidden = true
        } else {
            detailLabel!.hidden = false
            detailImage2!.hidden = false
            detailLabel!.text = detailLabel2
            detailImage2!.image = productImage2
        }
        
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.blackColor().CGColor
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }
    
    // ScrollView function to set the size of the scroll
    override func viewDidLayoutSubviews() {
        
        let scrollViewBounds = scrollView.bounds
        let contentViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsetsZero
        scrollViewInsets.top = scrollViewBounds.size.height/2.0;
        scrollViewInsets.top -= contentViewBounds.size.height/2.0;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height/2.0
        scrollViewInsets.bottom -= contentViewBounds.size.height/2.0;
        scrollViewInsets.bottom += 1
        
        scrollView.contentInset = scrollViewInsets
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
        let poolCategory = poolEquipment[indexPath.section]
        let product = poolCategory.products[indexPath.row]
        
        // Use collectionView to populate this details view
        let scrollData = PoolData(label: product.label, image: product.image, label2: product.label2, image2: product.image2, description: product.description)
        cell.configureCell(scrollData)
        return cell
    }
}
