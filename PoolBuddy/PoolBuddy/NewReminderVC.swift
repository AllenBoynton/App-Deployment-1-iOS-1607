//
//  NewReminderVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/31/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import EventKit

class NewReminderVC: UIViewController {
    
    var eventStore: EKEventStore!
    var datePicker: UIDatePicker!

    @IBOutlet weak var reminderTextView: UITextView!
    @IBOutlet var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        dateTextField.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
        
        dateTextField.layer.borderWidth = 2
        dateTextField.layer.borderColor = UIColor.blackColor().CGColor
        
        datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(NewReminderVC.addDate), forControlEvents: UIControlEvents.ValueChanged)
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        dateTextField.inputView = datePicker
        
        reminderTextView.becomeFirstResponder()
        reminderTextView.layer.cornerRadius = 3
        reminderTextView.layer.borderWidth = 2
        reminderTextView.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    func addDate(){
        self.dateTextField.text = self.datePicker.date.description
    }
    
    @IBAction func saveNewReminder(sender: AnyObject) {
        // 1
        let reminder = EKReminder(eventStore: self.eventStore)
        reminder.title = reminderTextView.text
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let dueDateComponents = appDelegate.dateComponentFromNSDate(self.datePicker.date)
        reminder.dueDateComponents = dueDateComponents
        reminder.calendar = self.eventStore.defaultCalendarForNewReminders()
        // 2
        do {
            try self.eventStore.saveReminder(reminder, commit: true)
            dismissViewControllerAnimated(true, completion: nil)
        }catch{
            print("Error creating and saving new reminder : \(error)")
        }
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
