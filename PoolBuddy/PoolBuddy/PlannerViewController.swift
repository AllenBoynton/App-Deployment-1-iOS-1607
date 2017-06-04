//
//  PlannerViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import SafariServices


class PlannerViewController: UIViewController, SFSafariViewControllerDelegate {
 
    fileprivate var urlString:String = "https://www.youtube.com/watch?v=vMpJGdhrO08"

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Custom nav bar title font and size
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        textField.text = "Weekly pool maintenance\nof your pool can be a\ndaunting list of tasks.\n\nWe at A & B Pools\nhave listed the more popular\nand most important tasks to help\nyou with your maintenance.\n\nThis is your initial roadmap.\nYou may change the existing\ntasks to better suit your schedule\nor needs of your pool."
        textField.textAlignment = NSTextAlignment.center
        textField.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor
                
//        if self.revealViewController() != nil {
//            menuButton.target = self.revealViewController()
//            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
//        self.revealViewController().rearViewRevealWidth = 325
    }
    
    @IBAction func openWithSafariVC(_ sender: AnyObject) {
        //TODO: Open in safari view controller
        let svc = SFSafariViewController(url: URL(string: self.urlString)!, entersReaderIfAvailable: true)
        svc.delegate = self
//        svc.view.tintColor = UIColor.blackColor()        
        self.present(svc, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func returnToMainMenu(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
}
