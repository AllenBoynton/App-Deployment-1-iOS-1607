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
 
    private var urlString:String = "https://www.youtube.com/watch?v=vMpJGdhrO08"

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Custom nav bar title font and size
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        textField.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
        
        textField.text = "Weekly pool maintenance of your\npool can be a daunting list of\n tasks.\n\nWe at A & B Pools have listed the\npopular and most imortant tasks\nto help you with your maintenance.\n\nThis is your initial roadmap. You\nmay change the existing tasks to\nbetter suit your schedule or needs\nof your pool."
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
    }
    
    @IBAction func openWithSafariVC(sender: AnyObject) {
        //TODO: Open in safari view controller
        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!, entersReaderIfAvailable: true)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
        
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
