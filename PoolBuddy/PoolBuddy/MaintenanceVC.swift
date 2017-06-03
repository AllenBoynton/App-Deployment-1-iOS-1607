//
//  MaintenanceVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/26/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit


class MaintenanceVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Data Source
    
    // Gives us access to the pool product inventory info listed in PoolCategory
    lazy var poolMaintenance: [PoolCategory] = {
        return PoolCategory.poolMaintenance()
    }()
        
    // Outlet for the display of collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Pool Maintenance"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        // Create collection view delegate
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return poolMaintenance.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let poolCategory = poolMaintenance[section]
        return poolCategory.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: maintenance, for: indexPath) as? MaintenanceCell {
            
            let poolCategory = poolMaintenance[indexPath.section]
            let product = poolCategory.products[indexPath.row]
            
            let poolData = PoolData(label: product.label, image: product.image, label2: product.label2, image2: product.image2, description: product.description)
            cell.configureCell(poolData)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth: CGFloat = collectionView.frame.width / 2.0 - 10.0 // 4 wide
        
        return CGSize(width: itemWidth, height: itemWidth)
    }

    // MARK: - Navigation
    
    // Passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Accessing segue by calling the segue identifier
        if segue.identifier == maintSegue {
            let destination = segue.destination as! MaintenanceDetailVC
            if let indexPath = collectionView.indexPath(for: sender as! UICollectionViewCell) {

                let poolCategory = poolMaintenance[indexPath.section]
                let product = poolCategory.products[indexPath.row]
                
                destination.productTitle = product.label
                destination.productImage = UIImage(named: product.image)
                destination.descriptions = product.description
            }
        }
    }
}
