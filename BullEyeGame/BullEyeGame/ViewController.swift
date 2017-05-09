      //
//  ViewController.swift
//  BullEyeGame
//
//  Created by wen zhang on 2017/5/8.
//  Copyright © 2017年 wen zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var round = 0
    

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        currentValue = Int(slider.value)
        
//        infoLabel.text = self.goalString()
        startNewRound()
        updateLabels()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
  
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        score = 0
        round = 0
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        print("The value of the slider is now: \(sender.value)")
        currentValue = lroundf(sender.value)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hitMeAction(_ sender: UIButton) {
        let difference: Int = abs(currentValue - targetValue);
        var points = 100 - difference
      
        let message = "The value of slider is \(currentValue)" + "\nThe target value is \(targetValue)" + "\nThe scrore is \(points)"
    
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            points += 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        round += 1
        
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertVC.addAction(UIAlertAction.init(title: "Awesome", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
            self.startNewRound()
            self.updateLabels()
        }))
        present(alertVC, animated: true) { 
        
        }
     

    }
    
    func updateLabels() {
        infoLabel.text = "Put the Bull's Eye as close as u can to: " + String(targetValue)
        scoreLabel.text = "Score: " + String(score)
        roundLabel.text = "Round: " + String(round)
    }
    
    func goalString() -> String {
        return "Put the Bull's Eye as close as u can to:\(self.generateRandomNumber())"
    
    }
    
    func generateRandomNumber() -> Int {
        targetValue = (Int)(arc4random() % 100) + 1
        return targetValue
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }

}

