//
//  EquipTableViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/2/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var equipImage: [UIImage] = []
    var equipLabel: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equipImage = [UIImage(named: "sandfilter")!]
        equipLabel = ["Pool Filters"]
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equipLabel.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("equipment_cell", forIndexPath: indexPath) as! EquipTableViewCell
        
        cell.imageView!.image = equipImage[indexPath.row]
        cell.textLabel!.text = equipLabel[indexPath.row]
        
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
