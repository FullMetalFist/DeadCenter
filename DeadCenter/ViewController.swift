//
//  ViewController.swift
//  DeadCenter
//
//  Created by Michael Vilabrera on 12/1/17.
//  Copyright © 2017 Michael Vilabrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 50
    
    var targetValue = 0
    
    var score = 0
    
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        startNewRound()
    }

    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        
        let points = 100 - difference
        
        let message = "You scored \(points) points"
        
        score += points
        
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
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

//exercise
// the least you can have is 1 point because if the random number lands on a 1 or 100, and you are off, the furthest from there will be 99 values.
