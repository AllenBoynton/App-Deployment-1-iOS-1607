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
        
        outputScreen.text = "0"
        
        let path = Bundle.main.path(forResource: "pat", ofType: "mp3")
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
        playSound()
        outputScreen.text = runningNumber
        processOperation(operation: .Add)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        playSound()
        outputScreen.text = runningNumber
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        playSound()
        outputScreen.text = runningNumber
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        playSound()
        outputScreen.text = runningNumber
        processOperation(operation: .Divide)
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        playSound()
        outputScreen.text = runningNumber
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

    @IBAction func mainMenuButtonPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
}
