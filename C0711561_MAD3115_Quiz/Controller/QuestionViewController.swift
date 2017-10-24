//
//  QuestionViewController.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-23.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: Parameters
    @IBOutlet weak var lblTimer: UILabel!
    
    var seconds = 20
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(QuestionViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        lblTimer.text = "\(seconds)"
        
        if seconds < 10 {
            lblTimer.textColor = .red
        }
        
        if seconds == 0 {
            timer.invalidate()
            
            seconds = 20
            
            lblTimer.text = "\(seconds)"
            
            lblTimer.textColor = .black
            
            runTimer()
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
