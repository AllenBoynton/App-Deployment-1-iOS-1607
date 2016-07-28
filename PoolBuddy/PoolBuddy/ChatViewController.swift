//
//  ChatViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import MessageUI

class ChatViewController: UIViewController {
    

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var chatTitle: UINavigationItem!
    
    var screenTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        chatTitle!.title = screenTitle
        
    }
    
    
    @IBAction func unwindActionToLiveChat(unwindSegue: UIStoryboardSegue) {}
}
