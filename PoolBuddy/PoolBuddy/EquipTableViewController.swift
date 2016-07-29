//
//  EquipTableViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/2/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Data Source
    
    // Gives us access to the pool product inventory info listed in PoolCategory
    lazy var poolEquipment: [PoolCategory] = {
        return PoolCategory.poolEquipment()
    }()
    
    // Outlets for table view screen
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 350

        navigationItem.title = "Equipment"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }

    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let poolCategory = poolEquipment[section]
        return poolCategory.menuItem
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return poolEquipment.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let poolCategory = poolEquipment[section]
        return poolCategory.products.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(equipment, forIndexPath: indexPath) as! EquipTableViewCell
                
        let poolCategory = poolEquipment[indexPath.section]
        let product = poolCategory.products[indexPath.row]
        
        let poolData = PoolData(label: product.label, image: product.image, label2: product.label2, image2: product.image2, description: product.description)
        cell.configureCell(poolData)
        return cell
    }

    
    // MARK: - Navigation

    // Passing data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Accessing segue by calling the segue identifier
        if segue.identifier == equipSegue {
            let destination = segue.destinationViewController as! EquipmentDetailVC
            if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                
                let poolCategory = poolEquipment[indexPath.section]
                let product = poolCategory.products[indexPath.row]
                
                destination.detailTitle = product.label
                destination.productImage = UIImage(named: product.image)
                destination.detailLabel2 = product.label2
                destination.productImage2 = UIImage(named: product.image2)
                destination.descriptions = product.description
            }
        }
    }
    
    // Reference to return to this category
    @IBAction func unwindActionToEquipment(unwindSegue: UIStoryboardSegue) {}
    
}
