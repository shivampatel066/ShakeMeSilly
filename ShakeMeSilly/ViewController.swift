//
//  ViewController.swift
//  ShakeMeSilly
//
//  Created by Shivam on 02/04/19.
//  Copyright © 2019 Shivam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startGameButton: UIButton!
    
    
    var timer = Timer()
    
    var timeInt = 10
    var scoreInt = 0
    var imageInt = 1
    var modeInt = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startGame(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
        modeInt = 1
        startGameButton.isEnabled = false
        startGameButton.alpha = 0.25
        startGameButton.setTitle("Shake Me", for: UIControl.State.normal)
        
        
    }
    
    @objc func startCounter() {
        
        timeInt -= 1
        timeLabel.text = String("Time : \(timeInt)")
        if timeInt < 1 {
            
            timer.invalidate()
            timeInt = 10
            scoreInt = 0
            modeInt = 0
            startGameButton.alpha = 1
            startGameButton.isEnabled = true
            startGameButton.setTitle("Restart", for: UIControl.State.normal)
            
        }
        
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
            if modeInt == 1 {
                scoreInt += 1
                scoreLabel.text = String(scoreInt)
                
                imageInt += 1
                
                if imageInt == 13 {
                    imageInt = 1
                }
                imageView.image = UIImage(named: "Face\(imageInt)")
            }
            
        }
    }
    
    
}

