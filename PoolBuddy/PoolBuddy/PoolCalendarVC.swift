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


// Global Initializers
let eventVC = "toSecondVC"

class PoolCalendarVC: UIViewController, EKCalendarChooserDelegate {
    
    let eventStore = EKEventStore()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextView!
    
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
        
        textField.text = "Weekly pool maintenance of your\npool can be a daunting list of\n tasks.\n\nWe at A & B Pools have listed the\npopular and most imortant tasks\nto help you with your maintenance.\n\nThis is your initial roadmap. You\nmay change the existing tasks to\nbetter suit your schedule or needs\nof your pool. "
    }
    
    @IBAction func createCalendar(sender: UIBarButtonItem) {

        let calendar = EKCalendar(forEntityType: .Event, eventStore: eventStore)
        
        // Configure
        calendar.title = "Pool Calendar"
        calendar.CGColor = UIColor.cyanColor().CGColor
        
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
    
        let chooser = EKCalendarChooser(selectionStyle: .Single, displayStyle: .AllCalendars, entityType: .Event, eventStore: eventStore)
        
        chooser.showsCancelButton = true
        chooser.showsDoneButton = true
        chooser.delegate = self
        
        // "You can choose your own nav VC or this is how to create a new one"
        let nav = UINavigationController(rootViewController: chooser)
        
        presentViewController(chooser, animated: true, completion: nil)
        
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
