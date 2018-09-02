//
//  ViewController.swift
//  BullsEye
//
//  Created by 陈年鑫 on 2018/9/2.
//  Copyright © 2018年 陈年鑫. All rights reserved.
//

import UIKit
import QuartzCore
class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetCurrent: Int = 4
    var score : Int = 0
    var round : Int = 0
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        let difference: Int = Int(abs(currentValue-targetCurrent))
        updateScoreAndRound()
        let mesage =  "当前数值是 \(currentValue),\n目标值是 \(targetCurrent),\n差值是\(difference)"
        
     
        let alert = UIAlertController(title:"Hello Messi",
                                      message:mesage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"ok",
                                   style: .default,
                                   handler: {action in self.startNewRound()})
        alert.addAction(action)
        present(alert,
                animated: true,
                completion: nil)
        
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)

//        print("当前数值是\(slider.value)")
    }
    
    func updateScoreAndRound(){
        let scoreInOnce: Int = Int(abs(currentValue-targetCurrent))
        score += 100-scoreInOnce
        scoreLabel.text = String(score)
        round += 1
        roundLabel.text = String(round)
    }
    func startNewRound(){
        targetCurrent = 1+Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func resetScoreAndRound(){
        score = 0
        round = 0
    }
    func updateLabels(){
        targetLabel.text = String(targetCurrent)
        scoreLabel.text=String(score)
        roundLabel.text=String(round)
    }
    
   @IBAction  func startNewGame(){
        resetScoreAndRound()
        startNewRound()
    let transition = CATransition()
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    view.layer.add(transition, forKey: nil)
    
    }

}

