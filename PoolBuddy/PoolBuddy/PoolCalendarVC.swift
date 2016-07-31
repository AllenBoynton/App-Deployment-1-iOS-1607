//
//  PoolCalendarVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/25/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//
import UIKit
import EventKit
import EventKitUI


class PoolCalendarVC: UIViewController, EKCalendarChooserDelegate {
    
    let eventStore = EKEventStore()
    
    @IBOutlet weak var poolImage: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Pool Calendar"
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        textView.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
        
        // Create authorization status
        let status = EKEventStore.authorizationStatusForEntityType(.Event)
        
        if status == .NotDetermined {
            // Request access to calendars
            eventStore.requestAccessToEntityType(.Event, completion: { (granted, error) -> Void in
                if let error = error {
                    print("Request FAILED with ERROR \(error)")
                    return
                }
                
                if granted {
                    print("Granted Access")
                } else {
                    // Disable some UI - Create Alert that we can't access the Calendar to check settings
                    print("Denied")
                }
            })
        }
    }
    
    @IBAction func createCalendar(sender: UIBarButtonItem) {

        let calendar = EKCalendar(forEntityType: .Event, eventStore: eventStore)
        
        // Configure
        calendar.title = "Pool Calendar"
        calendar.CGColor = UIColor.blueColor().CGColor
        
        for source in eventStore.sources {
            
            // Find local source
            if source.sourceType == EKSourceType.Local {
                calendar.source = source
                break
            }
        }
        
        // Save calendar to the database
        do {
            try eventStore.saveCalendar(calendar, commit: true)
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func displayChooser(sender: UIBarButtonItem) {
        let chooser = EKCalendarChooser(selectionStyle: .Single, displayStyle: .AllCalendars , entityType: .Event, eventStore: eventStore)
        
        chooser.showsCancelButton = true
        chooser.showsDoneButton = true
        chooser.delegate = self
        
        // "You can choose your own nav VC or this is how to create a new one"
//        let nav = UINavigationController(rootViewController: chooser)
        
        presentViewController(chooser, animated: true, completion: nil)
    }
}
