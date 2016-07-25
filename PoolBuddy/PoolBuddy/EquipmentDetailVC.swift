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
        
    // Outlets for table view screen
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var equipmentImg: UIImageView!
    @IBOutlet weak var equipmentTxt: UITextView!
    
    
    var detailTitle: String = ""
    var productImage: UIImage!
    var descriptions: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Using passed data to add to detail view
        navigationItem.title = detailTitle
        equipmentImg.image = productImage
        equipmentTxt.text = descriptions
        
        equipmentTxt.layer.cornerRadius = 4
        equipmentTxt.layer.borderWidth = 2
        equipmentTxt.layer.borderColor = UIColor.blackColor().CGColor
        
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
        
        let poolCategory = poolEquipment[indexPath.section]
        let product = poolCategory.products[indexPath.row]
        
        let poolData = PoolData(label: product.label, image: product.image, description: "")
        cell.configureCell(poolData)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Accessing segue by calling the segue identifier
//        if segue.identifier == equipSegue {
            let destination = segue.destinationViewController as! EquipmentDetailVC
            if let indexPath = self.collectionView.indexPathForCell(sender as! UICollectionViewCell) {
                
                let poolCategory = poolEquipment[indexPath.section]
                let product = poolCategory.products[indexPath.row]
                
                destination.productImage = UIImage(named: product.image)
                destination.detailTitle = product.label
                destination.descriptions = product.description
            }
//        }
    }
}
