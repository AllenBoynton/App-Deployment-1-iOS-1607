//
//  CalculatorVC.swift
//  PoolBuddy
//
//  Created by Allen Boynton on 7/4/16.
//  Copyright © 2016 Full Sail. All rights reserved.
//

import UIKit
import AVFoundation

class CalculatorVC: UIViewController {
    
    // Outlets for title and menu button
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var calculatorTitle: UINavigationItem!
    
    // Outlets for calculator screen
    @IBOutlet weak var outputScreen: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    enum Operation: String {
        case Divide   = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add      = "+"
        case Empty    = "Empty"
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr    = ""
    var rightValStr   = ""
    var result        = ""
    
    var buttonSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Pool Calculator"
        navigationController!.navigationBar.titleTextAttributes =
            ([NSFontAttributeName: UIFont(name: "KittenSlant", size: 20)!])
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 325
        
        outputScreen.text = "0"
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundLocal = URL(fileURLWithPath: path!)
        
        do {
            buttonSound = try AVAudioPlayer(contentsOf: soundLocal)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func playSound() {
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        buttonSound.play()
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputScreen.text = runningNumber
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(operation: .Add)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        processOperation(operation: currentOperation)
    }
    
    @IBAction func onClearPressed(_ sender: Any) {
        playSound()
        runningNumber = ""
        outputScreen.text = "0"
    }
    
    func processOperation(operation: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Divide {
                    
                    if rightValStr == "0" {
                        outputScreen.text = "E"
                    }
                    else {
                        result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                    }
                }
                
                leftValStr = result
                outputScreen.text = result
            }
            
            currentOperation = operation
        }
        else {
            // First time a number has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

}
