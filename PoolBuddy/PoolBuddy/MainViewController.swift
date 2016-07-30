//
//  MainViewController.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 6/29/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import AVFoundation

// Global Identifiers
let equipment = "equipment_cell"
let equipSegue = "toDetailVC"
let cleaningTools = "tools_cell"
let toolSegue = "toDetailVC"
let chemicals = "chemical_cell"
let chemSegue = "toDetailVC"
let chemistry = "water_chemistry_cell"
let wChemSegue = "toDetailVC"
let maintenance = "maint_cell"
let maintSegue = "toMaintDetailVC"
let planner = "planner"
let calculator = "calculator"
let photo = "photoCell"
let gallerySegue = "gallerySegue"
let chat = "chat"
let cellHeader = "header"


class MainViewController: UIViewController {
    
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
        self.revealViewController().rearViewRevealWidth = 350
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 22)!])
    }

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
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {}
}

