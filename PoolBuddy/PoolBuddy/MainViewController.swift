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
let toDetailVC = "toDetailVC"
let cleaningTools = "tools_cell"
let chemicals = "chemical_cell"
let chemistry = "water_chemistry_cell"
let maintenance = "maint_cell"
let reminders = "reminderCell"
let planner = "planner"
let calculator = "calculator"
let photo = "photoCell"
let gallerySegue = "gallerySegue"
let cellHeader = "header"


class MainViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
        
    // Audio player
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        prepareAudios()
    }

    // Sound files
    func prepareAudios() {
        
        let path1 = Bundle.main.path(forResource: "splash.mp3", ofType: nil)!
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path1))
            audioPlayer.prepareToPlay()
        }
        catch let err as NSError {
            print("Something bad happened \(err). Try catching specific errors to narrow things down")
        }
    }

    @IBAction func menuButton(_ sender: UIBarButtonItem) {
        // Play sound effect
        audioPlayer.play()
    }
    
}

