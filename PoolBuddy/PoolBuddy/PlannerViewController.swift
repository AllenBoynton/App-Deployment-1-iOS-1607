//
//  PlannerViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import SwiftWebVC


class PlannerViewController: UIViewController {
 
    fileprivate var urlString: String = "https://alboynton4.wixsite.com/alsmobileapps/"

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var contentView: UIView!
    
    var delegate: SwiftWebVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Maintenance Planner"
        
        textField.text = "Until you fall into a routine, we Pool Buddy would like to start you off with the basics. You will find some default reminders that should be followed as best you can. Think of them as your initial road map.\n\nYou may also Add or Remove tasks that need to be done.It can also be helpful to set notifications and priorities for each task.\n\nYou will eventually find yourself in a schedule that works for you without even needing a Planner, but until then… Use the Pool Planner.\n\nGood Luck!"
        
        textField.textAlignment = NSTextAlignment.center
        textField.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func openWithSwiftWebVC(_ sender: AnyObject) {
        //TODO: Open in chrome view controller
        let webVC = SwiftModalWebVC(urlString: urlString)
        self.present(webVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    func chromeViewControllerDidFinish(_ controller: SwiftWebVC) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func returnToMainMenu(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
}
