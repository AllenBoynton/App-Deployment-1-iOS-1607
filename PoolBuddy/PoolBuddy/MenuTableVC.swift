//
//  MenuTableVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/24/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit

class MenuTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }
}
