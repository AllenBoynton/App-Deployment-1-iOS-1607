//
//  PoolCalendarVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/25/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//
import Foundation
import UIKit
import EventKit
import WebKit
import Alamofire


// Global Initializers
let eventVC = "toSecondVC"

class PoolCalendarVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var referenceView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pool Calendar"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            referenceView.hidden = true
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        // Create authorization status
        let status = EKEventStore.authorizationStatusForEntityType(.Event)
        
        if status == .NotDetermined {
            // Request access to calendars
            Global.eventStore.requestAccessToEntityType(.Event, completion: { (granted, error) -> Void in
                if error == error {
                    print("Request FAILED with ERROR \(error)")
                    return
                }
                
                if granted {
                    print("Granted Access")
                } else {
                    // Disable some UI
                    print("Denied")
                }
            })
        }
        
        textField.text = "Weekly pool maintenance of your\npool can be a daunting list of\n tasks.\n\nWe at A & B Pools have listed the\npopular and most imortant tasks\nto help you with your maintenance.\n\nThis is your initial roadmap. You\nmay change the existing tasks to\nbetter suit your schedule or needs\nof your pool. "
    }
    
    @IBAction func createCalendar(sender: UIBarButtonItem) {
        // Check the status
        
        Cal.newCalendar = EKCalendar(forEntityType: .Event, eventStore: Global.eventStore)
        
        // Configure
        Cal.newCalendar.title = "Pool Calendar"
        Cal.newCalendar.CGColor = UIColor.cyanColor().CGColor
        
        for source in Global.eventStore.sources {
            
            // Find local source
            if source.sourceType == EKSourceType.Local {
                Cal.newCalendar.source = source
                break
            }
        }
        
        // Save calendar to the database
        do {
            try Global.eventStore.saveCalendar(Cal.newCalendar, commit: true)
        } catch let error as NSError {
            print(error)
        }
    }
    
    @IBAction func referenceButton(sender: UIButton) {
        if referenceView.hidden == false {
            referenceView.hidden = true
        } else if referenceView.hidden == true {
            referenceView.hidden = false
        }
        
    }
    
    @IBAction func unwindActionToReminders(unwindSegue: UIStoryboardSegue) {}
}
