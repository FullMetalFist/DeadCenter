//
//  ViewController.swift
//  DeadCenter
//
//  Created by Michael Vilabrera on 12/1/17.
//  Copyright © 2017 Michael Vilabrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        startNewRound()
    }

    
    @IBAction func showAlert() {
        var difference: Int
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        
        let message = "current value is: \(currentValue)" + "\nthe target value is: \(targetValue)" + "\nThe difference is \(difference)"
        let alert = UIAlertController(title: "Heylo World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("slider value is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

