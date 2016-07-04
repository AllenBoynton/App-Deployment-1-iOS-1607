//
//  MenuTableViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/1/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var menuImage: [UIImage] = []
    var menuItemLabel: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
            
        menuImage = [UIImage(named: "equipment1")!]
    
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuImage.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menu_cell", forIndexPath: indexPath) as! MenuTableViewCell
        
        cell.imageView!.image = menuImage[indexPath.row]
        cell.textLabel!.text = "Pool Equipment"
        
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
