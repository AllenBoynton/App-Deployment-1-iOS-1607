//
//  EditViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/31/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import EventKit

class EditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate { 
    
    var eventStore: EKEventStore!
    var reminders: [EKReminder]!
    var selectedReminder: EKReminder!

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.eventStore = EKEventStore()
        self.reminders = [EKReminder]()
        self.eventStore.requestAccess(to: EKEntityType.reminder) { (granted: Bool, error: NSError?) -> Void in
            
            if granted{
                
                let predicate = self.eventStore.predicateForReminders(in: nil)
                self.eventStore.fetchReminders(matching: predicate, completion: { (reminders: [EKReminder]?) -> Void in
                    
                    self.reminders = reminders
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                })
            } else {
                print("The app is not permitted to access reminders, make sure to grant permission in the settings and try again")
            }
        } as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler as! EKEventStoreRequestAccessCompletionHandler
    }

    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.selectedReminder = self.reminders[indexPath.row]
        self.performSegue(withIdentifier: "ShowReminderDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "reminderCell")
        let reminder:EKReminder! = self.reminders![indexPath.row]
        cell.textLabel?.text = reminder.title
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        if let dueDate = (reminder.dueDateComponents as NSDateComponents?)?.date{
            cell.detailTextLabel?.text = formatter.string(from: dueDate)
        }else{
            cell.detailTextLabel?.text = "N/A"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let reminder: EKReminder = reminders[indexPath.row]
        do{
            try eventStore.remove(reminder, commit: true)
            self.reminders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }catch{
            print("An error occurred while removing the reminder from the Calendar database: \(error)")
        }        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowReminderDetails"{
            let reminderDetailsVC = segue.destination as! ReminderDetailsVC
            reminderDetailsVC.reminder = self.selectedReminder
            reminderDetailsVC.eventStore = eventStore
        }else{
            let newReminderVC = segue.destination as! NewReminderVC
            newReminderVC.eventStore = eventStore
        }
    }
    
    @IBAction func editTable(_ sender: AnyObject) {
        tableView.isEditing = !tableView.isEditing
        if tableView.isEditing{
            tableView.setEditing(true, animated: true)
        }else{
            tableView.setEditing(false, animated: true)
        }
    }
}
