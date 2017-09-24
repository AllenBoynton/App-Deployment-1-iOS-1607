//
//  MenuTableVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/24/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import SwiftWebVC

class MenuTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Main Menu"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
//        let indexPath = tableView.indexPathForSelectedRow
//        
//        //getting the current cell from the index path
//        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
//        print(currentCell)
//        
//        let webVC = SwiftModalWebVC(urlString: "https://youtu.be/TDQSSYwhWEM", theme: .dark, dismissButtonStyle: .arrow)
//        self.show(webVC, sender: currentCell)
    }
    
    @IBAction func returnToHomeScreenBtnPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
