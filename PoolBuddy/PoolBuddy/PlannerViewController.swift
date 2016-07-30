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


class PlannerViewController: UIViewController {
    
    let eventStore = EKEventStore()
    
    @IBOutlet weak var poolImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pool Reminders"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
                
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
}
