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


class PoolCalendarVC: UIViewController, EKCalendarChooserDelegate, EKEventEditViewDelegate {
    
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
        
        // Configure attributes
        calendar.title = "Pool Calendar"
        calendar.CGColor = UIColor.blueColor().CGColor
        
        // Assigns calendar to local source
        for source in eventStore.sources {
            
            // Find local source
            if source.sourceType == EKSourceType.Local {
                calendar.source = source
                break
            }
        }
        
        // Save calendar to the database
        do {
            try eventStore.saveCalendar(calendar, commit: true) // true = saves immediately
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func displayChooser(sender: UIBarButtonItem) {
        let chooser = EKCalendarChooser(selectionStyle: .Multiple, displayStyle: .AllCalendars , entityType: .Event, eventStore: eventStore)
        
        chooser.showsCancelButton = true
        chooser.showsDoneButton = true
        chooser.delegate = self
        
        // "You can choose your own nav VC or this is how to create a new one"
        let nav = UINavigationController(rootViewController: chooser)
        
        presentViewController(nav, animated: true, completion: nil)
    }
    
    // Creates New Event through Events VC edit
    @IBAction func displayEventEdit(sender: UIBarButtonItem) {
        let eventVC = EKEventEditViewController()
        
        eventVC.eventStore = eventStore
        eventVC.editViewDelegate = self
        
        presentViewController(eventVC, animated: true, completion: nil)
    }
    
    // MARK: - EKEventEditViewDelegate
    func eventEditViewController(controller: EKEventEditViewController, didCompleteWithAction action: EKEventEditViewAction) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - EKCalendarChooserDelegate
    func calendarChooserDidCancel(calendarChooser: EKCalendarChooser) {
        print("Cancel was tapped")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func calendarChooserDidFinish(calendarChooser: EKCalendarChooser) {
        print("Done was tapped")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func calendarChooserSelectionDidChange(calendarChooser: EKCalendarChooser) {
        presentViewController(calendarChooser, animated: true, completion: nil)
    }
}
