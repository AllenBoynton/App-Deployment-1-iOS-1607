//
//  ChemiicalTableVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class ChemicalTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Data Source
    
    // Gives us access to the pool product inventory info listed in PoolCategory
    lazy var poolChemicals: [PoolCategory] = {
        return PoolCategory.poolChemicals()
    }()
    
    //
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        navigationItem.title = "Chemicals"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let poolCategory = poolChemicals[section]
        return poolCategory.menuItem
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return poolChemicals.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let poolCategory = poolChemicals[section]
        return poolCategory.products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(chemicals, forIndexPath: indexPath) as! ChemicalTableViewCell
        
        let poolCategory = poolChemicals[indexPath.section]
        let product = poolCategory.products[indexPath.row]
        
        let poolData = PoolData(label: product.label, image: product.image, description: "")
        cell.configureCell(poolData)
        return cell
    }
    
    
    // MARK: - Navigation
    
    // Passing data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Accessing segue by calling the segue identifier
        if segue.identifier == chemSegue {
            let destination = segue.destinationViewController as! ChemicalDetailVC
            if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                
                let poolCategory = poolChemicals[indexPath.section]
                let product = poolCategory.products[indexPath.row]
                
                destination.productImage = UIImage(named: product.image)
                destination.detailTitle = product.label
                destination.descriptions = product.description
            }
        }
    }
}
