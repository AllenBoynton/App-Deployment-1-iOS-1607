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
        
        let itemWidth: CGFloat = collectionView.frame.width / 3.0 - 10.0 // 2 wide
        
        return CGSize(width: itemWidth, height: 90)
    }

    // MARK: - Navigation
    
    // Passing data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Accessing segue by calling the segue identifier
        if segue.identifier == toDetailVC {
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
    
    // Header protocol
    
    // Create view for header using supplementary view: CollectionReusableView
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "maint_header", for: indexPath) as! HeaderReusableView
        
        // Sourcing data from datasource within poolsingroup to isolate the group protocol
        let poolCategory = poolMaintenance[indexPath.section]
        let product = poolCategory.group
        // Displays group protocol to header view label
        headerView.sectionTitle.text = product
        
        return headerView
    }
    
    @IBAction func mainMenuButtonPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
}
