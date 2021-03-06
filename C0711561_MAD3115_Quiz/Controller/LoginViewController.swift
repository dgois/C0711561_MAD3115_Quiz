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
    
    var quizUserDefault = UserDefaults.standard
    let validUsers: [String: String] = ["denisgois":"123", "arthurgois":"123", "mary":"123"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInterfaceModifications()
        
        retrieveUserNameAndPasswordFromUserDefault()
    }
    
    fileprivate func doInterfaceModifications() {
        configureLeftImageOfInputs(textField: txtUserName, imageName: "icon-user")
        configureLeftImageOfInputs(textField: txtPassword, imageName: "icon-password")
        hideNavigationButton()
    }
    
    fileprivate func hideNavigationButton() {
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
    
    fileprivate func retrieveUserNameAndPasswordFromUserDefault() {
        if let userName = quizUserDefault.string(forKey: "userName") {
            txtUserName.text = userName
        }
        
        if let password = quizUserDefault.string(forKey: "userPassword") {
            txtPassword.text = password	
        }
    }
    
    @IBAction func loginTapButton(_ sender: UIButton) {
        if isValidUserAndPassword() {
            configureRememberMe()
            setLoggedUserNameOnUserDefault()
            self.performSegue(withIdentifier: "initialSceneSegue", sender: nil)
        } else {
            createFailedAlertMessage()
        }
    }
    
    fileprivate func isValidUserAndPassword() -> Bool {
        return validUsers[txtUserName.text!] != nil && validUsers[txtUserName.text!] == txtPassword.text
    }
    
    fileprivate func configureRememberMe() {
        if switchRememberMe.isOn {
            quizUserDefault.set(txtUserName.text, forKey: "userName")
            quizUserDefault.set(txtPassword.text, forKey: "userPassword")
        } else {
            quizUserDefault.removeObject(forKey: "userName")
            quizUserDefault.removeObject(forKey: "userPassword")
        }
    }
    
    fileprivate func setLoggedUserNameOnUserDefault() {
        quizUserDefault.set(txtUserName.text!, forKey: "loggedUserName")
    }
    
    fileprivate func createFailedAlertMessage() {
        let alert = UIAlertController(title: "Login Failed", message: "Sorry, you entered an incorrect email address or password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func configureLeftImageOfInputs(textField: UITextField, imageName: String) {
        textField.leftViewMode = .always
        
        let image = UIImage(named: imageName)
        let imageView = UIImageView(frame: CGRect(x: 12, y: 0, width: 25, height: 25))
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        
        imageView.image = image
        view.addSubview(imageView)
        
        textField.leftView = view
    }
}

