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
        // Do any additional setup after loading the view, typically from a nib.
//        currentValue = lroundf(slider.value)
//
//        targetValue = 1 + Int(arc4random_uniform(100))
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
//        let alert = UIAlertController(title: "Hey There", message: "This is nice", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Sweet", style: .default, handler: nil)
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
        let message = "current value is: \(currentValue)" + "\nthe target value is: \(targetValue)"
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
//        currentValue = 50       // exercise: modify code so slider does not reset
//        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

