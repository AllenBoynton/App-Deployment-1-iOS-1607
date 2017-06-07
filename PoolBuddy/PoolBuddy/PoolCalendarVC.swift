//
//  PoolCalendarVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/25/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//
import UIKit

class PoolCalendarVC: UIViewController {
        
    @IBOutlet weak var poolImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pool Calendar"
        
            
        textView.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
    }
}
