//
//  EquipTableViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/2/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class EquipTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var equipmentDetail: PoolData! = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var equipmentTitle: UINavigationItem!
    
    
    var equipImage: [UIImage] = []
    var equipLabel: [String] = []
    
    var screenTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equipImage = [UIImage(named: "sandfilter")!]
        equipLabel = ["Pool Filters"]
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325

        equipmentTitle!.title = screenTitle
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equipLabel.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(equipment, forIndexPath: indexPath) as! EquipTableViewCell
        
        cell.equipmentImage.image = equipImage[indexPath.row]
        cell.equipmentLabel.text = equipLabel[indexPath.row]
        
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
