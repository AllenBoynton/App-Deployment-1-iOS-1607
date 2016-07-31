//
//  WaterChemTableVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class WaterChemTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Data Source
    
    // Gives us access to the pool product inventory info listed in PoolCategory
    lazy var waterChemistry: [PoolCategory] = {
        return PoolCategory.waterChemistry()
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
        self.revealViewController().rearViewRevealWidth = 325
        
        navigationItem.title = "Water Balance"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
    }

    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let poolCategory = waterChemistry[section]
        return poolCategory.menuItem
    }
    
    // Changes header BG color and text color
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Background color
        view.tintColor = UIColor.init(red: 64/255, green: 224/255, blue: 208/255, alpha: 1.0)
        // Text Color
        let header: UITableViewHeaderFooterView = (view as! UITableViewHeaderFooterView)
        header.textLabel!.textColor = UIColor.blackColor()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return waterChemistry.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let poolCategory = waterChemistry[section]
        return poolCategory.products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(chemistry, forIndexPath: indexPath) as! WaterChemTableViewCell
        
        let poolCategory = waterChemistry[indexPath.section]
        let product = poolCategory.products[indexPath.row]
        
        let poolData = PoolData(label: product.label, image: product.image, label2: product.label2, image2: product.image2, description: product.description)
        cell.configureCell(poolData)
        return cell
    } 
    
    
    // MARK: - Navigation
    
    // Passing data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Accessing segue by calling the segue identifier
        if segue.identifier == wChemSegue {
            let destination = segue.destinationViewController as! WaterChemDetailVC
            if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                let poolCategory = waterChemistry[indexPath.section]
                let product = poolCategory.products[indexPath.row]
                
                destination.detailTitle = product.label
                destination.productImage = UIImage(named: product.image)
                destination.descriptions = product.description
            }
        }
    }
}
