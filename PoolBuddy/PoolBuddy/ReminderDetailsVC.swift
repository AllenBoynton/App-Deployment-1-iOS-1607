//
//  ReminderDetailsVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/31/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import EventKit


class ReminderDetailsVC: UIViewController {
    
    var datePicker: UIDatePicker!
    var reminder: EKReminder!
    var eventStore: EKEventStore!
    
    // Outlets for text
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet weak var reminderTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTextField.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
        dateTextField.layer.borderWidth = 2
        dateTextField.layer.borderColor = UIColor.black.cgColor
                
        self.reminderTextView?.text = self.reminder.title
        datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(ReminderDetailsVC.addDate), for: UIControlEvents.valueChanged)
        datePicker.datePickerMode = UIDatePickerMode.dateAndTime
        dateTextField.inputView = datePicker
        
        reminderTextView.becomeFirstResponder()
        reminderTextView.layer.cornerRadius = 3
        reminderTextView.layer.borderWidth = 2
        reminderTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    func addDate(){
        self.dateTextField.text = self.datePicker.date.description
    }
    
    // Action to save reminders
    @IBAction func saveReminder(_ sender: AnyObject) {
        self.reminder.title = reminderTextView.text
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let dueDateComponents = appDelegate.dateComponentFromNSDate(self.datePicker.date)
        reminder.dueDateComponents = dueDateComponents
        reminder.calendar = self.eventStore.defaultCalendarForNewReminders()
        do {
            try self.eventStore.save(reminder, commit: true)
            self.navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Error creating and saving new reminder : \(error)")
        }
    }
}
