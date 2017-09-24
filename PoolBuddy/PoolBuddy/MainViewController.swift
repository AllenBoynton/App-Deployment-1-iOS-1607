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
                
    }

    // Sound files
    func prepareAudios() {
        
        let path1 = URL.init(fileURLWithPath: Bundle.main.path(forResource: "splash", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: path1)
            audioPlayer.delegate = self as? AVAudioPlayerDelegate
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
    }

    @IBAction func menuButton(_ sender: UIBarButtonItem) {
        // Play sound effect
        audioPlayer.play()
        print("Audio playing")
    }
}

