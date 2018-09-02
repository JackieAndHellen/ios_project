//
//  ButtonViewController.swift
//  BullsEye
//
//  Created by 陈年鑫 on 2018/9/2.
//  Copyright © 2018年 陈年鑫. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func changeVisible(ui: UIButton){
       
        if ui.currentTitle == "隐藏1"{
            self.setViewHidden(ui: self.aButton)
          
        }else if ui.currentTitle == "隐藏2"{
         
           self.setViewHidden(ui: self.bButton)
        }else if ui.currentTitle == "隐藏全部"{
             self.setViewHidden(ui: self.stackView)
//            UIView.animate(withDuration: 0.7) {
//                self.stackView.isHidden = !self.stackView.isHidden
//            }
        }
        
    }
    func setViewHidden(ui: UIView){
        if ui.isHidden{
            ui.isHidden = !ui.isHidden;
        }else{
            UIView.animate(withDuration: 0.7){
                ui.isHidden = !ui.isHidden;
            }
        }
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
}
