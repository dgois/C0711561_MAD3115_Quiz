//
//  ViewController.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-23.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    var myUserDefault = UserDefaults.standard
    let validUsers: [String: String] = ["denisgois":"123", "arthurgois":"123"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userName = myUserDefault.value(forKey: "userName") {
            txtUserName.text = userName as? String
        }
        
        if let password = myUserDefault.value(forKey: "userPassword") {
            txtPassword.text = password as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func loginTapButton(_ sender: UIButton) {
        if validUsers[txtUserName.text!] != nil && validUsers[txtUserName.text!] == txtPassword.text {
            configureRememberMe()
            self.performSegue(withIdentifier: "initialSceneSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Fail Login", message: "User/Pass is wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    fileprivate func configureRememberMe() {
        if switchRememberMe.isOn {
            myUserDefault.set(txtUserName.text, forKey: "userName")
            myUserDefault.set(txtPassword.text, forKey: "userPassword")
        } else {
            myUserDefault.removeObject(forKey: "userName")
            myUserDefault.removeObject(forKey: "userPassword")
        }
    }
}

