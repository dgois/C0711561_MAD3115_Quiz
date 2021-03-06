//
//  PlayViewController.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-23.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "playSceneSegue", sender: nil)
    }
    
    @IBAction func instructionsTapButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "instructionSceneSegue", sender: nil)
    }
    
    @IBAction func rankingTapButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "rankingSceneSegue", sender: nil)
    }
    
    @IBAction func logoutButtonTap(_ sender: UIBarButtonItem) {
        if let loginViewController = storyboard?.instantiateViewController(withIdentifier: "loginScene") {
            self.present(loginViewController, animated: true, completion: nil)
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
