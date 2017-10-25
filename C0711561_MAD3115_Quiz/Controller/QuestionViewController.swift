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
    
    @IBOutlet weak var lblQuestionStatement: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionTree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    
    var questions: [Question] = [Question]()
    
    var options = [UIButton]()
    
    var seconds = 20
    var timer = Timer()

    var amountOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        createQuestions()
        options = [optionOne, optionTwo, optionTree, optionFour]
        
        options.forEach { (button) in
            button.backgroundColor = UIColor.white
        }
        
        lblQuestionStatement.text = questions[amountOfQuestions].statement
        
        optionOne.setTitle(questions[amountOfQuestions].options?[0], for: [])
        optionTwo.setTitle(questions[amountOfQuestions].options?[1], for: [])
        optionTree.setTitle(questions[amountOfQuestions].options?[2], for: [])
        optionFour.setTitle(questions[amountOfQuestions].options?[3], for: [])
        
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
        
        if seconds < 5 {
            lblTimer.textColor = .red
        }
        
        if seconds == 0 {
            resetTimer()
            configureNextQuestion()
        }
    }
    
    @IBAction func selectOption(_ sender: UIButton) {
        
        options.forEach { (button) in
            button.backgroundColor = UIColor.white
        }
        
        sender.backgroundColor = UIColor.black
        
    }
    
    fileprivate func resetTimer() {
        timer.invalidate()
        
        seconds = 20
        
        lblTimer.text = "\(seconds)"
        
        lblTimer.textColor = .black
        
        runTimer()
    }
    
    
    func createQuestions() {
        questions = [
            Question(statement: "What is the population of Brazil?",
                              options: ["184,200,000", "256,988,000", "100,000.000", "145,000,000"],
                              correctOptionIndex: 1),
            Question(statement: "________ is Brazil's most common religion.",
                     options: ["Christianity", "Islam", "Hinduism", "Buddhism"],
                     correctOptionIndex: 2),
            Question(statement: "What is Brazil's type of government?",
                     options: ["Democratic", "Dictatorship", "Monarchy", "Federal Republic"],
                     correctOptionIndex: 3),
        ]
    }
    
    fileprivate func configureNextQuestion() {
        if (amountOfQuestions < questions.count - 1) {
            amountOfQuestions += 1
            lblQuestionStatement.text = questions[amountOfQuestions].statement
            
            optionOne.setTitle(questions[amountOfQuestions].options?[0], for: [])
            optionTwo.setTitle(questions[amountOfQuestions].options?[1], for: [])
            optionTree.setTitle(questions[amountOfQuestions].options?[2], for: [])
            optionFour.setTitle(questions[amountOfQuestions].options?[3], for: [])
            
            
        } else {
            print("show end alert")
        }
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        
        configureNextQuestion()
        
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
