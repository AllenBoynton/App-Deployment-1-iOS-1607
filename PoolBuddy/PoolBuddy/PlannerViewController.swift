//
//  PlannerViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import EventKit


class PlannerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pool Reminders"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
                
        // Create authorization status
        let status = EKEventStore.authorizationStatusForEntityType(.Reminder)
        
        if status == .NotDetermined {
            // Request access to calendars
            Global.eventStore.requestAccessToEntityType(.Reminder, completion: { (granted, error) -> Void in
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
    
    @IBAction func createEvent(sender: UIBarButtonItem) {
        let event = EKEvent(eventStore: Global.eventStore)
        
        event.title = "Pool Buddy"
        event.startDate = NSDate()
        event.endDate = event.startDate.dateByAddingTimeInterval(3600)
        
        // Save to
        event.calendar = Cal.newCalendar
        
        // Save the event
        do {
            try Global.eventStore.saveEvent(event, span: .ThisEvent, commit: true)
        } catch {
            print(error)
        }
    }
    
    @IBAction func createReminder(sender: UIBarButtonItem) {
        // Check the status
        
        let reminder = EKReminder(eventStore: Global.eventStore)
        
        reminder.title = "Pool Reminders"
        reminder.startDateComponents = NSCalendar.currentCalendar().components([.Month, .Day, .Year], fromDate: NSDate())
        
        reminder.calendar = Cal.newCalendar
        
        // Save calendar to the database
        do {
            try Global.eventStore.saveReminder(reminder, commit: true)
        } catch let error as NSError {
            print(error)
        }
    }
}
