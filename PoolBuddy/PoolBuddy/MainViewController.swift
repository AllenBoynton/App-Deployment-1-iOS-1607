//
//  ViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 6/29/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    

    // Audio player
    var splash = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }

//    // MARK: - Table view data source
//    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 7
//    }
//    
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("equipment_cell", forIndexPath: indexPath) as! MenuTableViewCell
//        

    // Sound files
    func prepareAudios() {
        
        let audioPath1 = NSBundle.mainBundle().pathForResource("splash", ofType: "wav")
        let error1: NSError? = nil
        do {
            splash = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath1!))
        }
        catch {
            print("Something bad happened \(error1). Try catching specific errors to narrow things down")
        }
    }

    @IBAction func menuButton(sender: UIBarButtonItem) {
        // A sound for button
        prepareAudios()
        splash.play()
    }
}

