//
//  MenuTableViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/1/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
//    var menuImage: [UIImage] = []
    var menuItemLabel: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
            
//        menuImage = [UIImage(named: "sandfilter")!, UIImage(named: "chemicals1")!, UIImage(named: "chemicals1")!, UIImage(named: "chemicals1")!, UIImage(named: "chemicals1")!, UIImage(named: "chemicals1")!]
        menuItemLabel = ["Pool Equipment", "Pool Chemicals", "Water Chemistry", "Routine Maintenance", "Weekly Planner", "Pool Calculator", "Problems Gallery", "Live Chat"]
        
        self.title = "Pool Buddy Menu"
    }
    
        
    // MARK: - Navigation

    // Function connects segue from View Controller to Detail View
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destination: EquipTableViewController = segue.destinationViewController as! EquipTableViewController
        
        let indexPath: NSIndexPath? = tableView.indexPathForSelectedRow!
        
        let screenTitle = menuItemLabel[(indexPath?.row)!]
        
        destination.screenTitle = screenTitle
    }
}
