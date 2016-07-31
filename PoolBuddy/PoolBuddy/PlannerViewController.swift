//
//  PlannerViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

// Global Initializers
let eventVC = "toSecondVC"

class PlannerViewController: UIViewController {
    
    let eventStore = EKEventStore()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var referenceView: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Common Tasks"
        
        // Custom nav bar title font and size
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        textField.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
        
        textField.text = "Weekly pool maintenance of your\npool can be a daunting list of\n tasks.\n\nWe at A & B Pools have listed the\npopular and most imortant tasks\nto help you with your maintenance.\n\nThis is your initial roadmap. You\nmay change the existing tasks to\nbetter suit your schedule or needs\nof your pool."
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            referenceView.hidden = true
        }
        self.revealViewController().rearViewRevealWidth = 325
                
        // Create authorization status
        let status = EKEventStore.authorizationStatusForEntityType(.Reminder)
        
        if status == .NotDetermined {
            // Request access to calendars
            eventStore.requestAccessToEntityType(.Reminder, completion: { (granted, error) -> Void in
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
    }
    
    @IBAction func createReminder(sender: UIBarButtonItem) {
        // Check the status
        
        let reminder = EKCalendar(forEntityType: .Reminder, eventStore: eventStore)
        
        reminder.title = "Pool Reminders"
        reminder.CGColor = UIColor.blueColor().CGColor
//        reminder.startDateComponents = NSCalendar.currentCalendar().components([.Month, .Day, .Year], fromDate: NSDate())
        
//        reminder.calendar = calendar
        // Save to
        for source in eventStore.sources {
            
            // Find local source
            if source.sourceType == EKSourceType.Local {
                reminder.source = source
                break
            }
        }
        
        // Save calendar to the database
        do {
            try eventStore.saveCalendar(reminder, commit: true)
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
}
