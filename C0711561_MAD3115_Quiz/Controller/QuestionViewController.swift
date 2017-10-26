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
    
    @IBOutlet weak var questionsProgressBar: UIProgressView!
    @IBOutlet weak var lblProgressQuestions: UILabel!
    
    var questions: [Question] = [Question]()
    var options = [UIButton]()
    
    var seconds = 10
    var timer = Timer()

    var answeredQuestionsAmount = 0
    
    var summary: EndQuizSummary?
    
    var selectedOptionButton: UIButton?
    
    var myUserDefault = UserDefaults.standard
    
    fileprivate func cleanAnswerSelection() {
        options.forEach { (button) in
            button.backgroundColor = UIColor.white
        }
    }
    
    fileprivate func hideNavigationButton() {
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationButton()
        
        runTimer()
        createQuestions()
        options = [optionOne, optionTwo, optionTree, optionFour]
        
        cleanAnswerSelection()
        
        configureNextQuestion()
        
        summary = EndQuizSummary(totalQuestions: questions.count)
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
        
        if seconds <= 5 {
            lblTimer.textColor = .red
        }
        
        if seconds == 0 {
            verifyCorrectness()
            configureNextQuestion()
        }
    }
    
    @IBAction func selectOption(_ sender: UIButton) {
        
        options.forEach { (button) in
            button.backgroundColor = UIColor.white
        }
        
        sender.backgroundColor = UIColor.black
        
        selectedOptionButton = sender
        
    }
    
    fileprivate func resetTimer() {
        timer.invalidate()
        
        seconds = 10
        
        lblTimer.text = "\(seconds)"
        
        lblTimer.textColor = .black
        
        runTimer()
    }
    
    fileprivate func pauseTimer() {
        timer.invalidate()
    }
    
    
    func createQuestions() {
        questions = [
            Question(statement: "What is the population of Brazil?",
                              options: ["184,200,000", "256,988,000", "100,000.000", "145,000,000"],
                              correctOptionIndex: 1),
            Question(statement: "________ is Brazil's most common religion.",
                     options: ["Christianity", "Islam", "Hinduism", "Buddhism"],
                     correctOptionIndex: 0),
            Question(statement: "What is Brazil's type of government?",
                     options: ["Democratic", "Dictatorship", "Monarchy", "Federal Republic"],
                     correctOptionIndex: 3),
        ]
    }
    
    fileprivate func showSummaryAlert() {
        let summaryAlertViewController = UIAlertController(title: "Summary Quiz Result", message: summary?.getSummaryText(), preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {
            [weak summaryAlertViewController] _ in
            if let _ = summaryAlertViewController {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        let rankingActin = UIAlertAction(title: "Ranking", style: .default) {
            [weak summaryAlertViewController] _ in
            if let _ = summaryAlertViewController {
                //self.navigationController?.viewControllers.removeLast()
                self.performSegue(withIdentifier: "rankingSceneSegueFromSummary", sender: nil)
            }
        }
        
        summaryAlertViewController.addAction(okAction)
        summaryAlertViewController.addAction(rankingActin)
        
        self.present(summaryAlertViewController, animated: true, completion: nil)
    }
    
    fileprivate func configureNextQuestion() {
        if (answeredQuestionsAmount < questions.count) {
            lblQuestionStatement.text = "\(answeredQuestionsAmount + 1) - \(questions[answeredQuestionsAmount].statement)"
            
            optionOne.setTitle(questions[answeredQuestionsAmount].options[0], for: [])
            optionTwo.setTitle(questions[answeredQuestionsAmount].options[1], for: [])
            optionTree.setTitle(questions[answeredQuestionsAmount].options[2], for: [])
            optionFour.setTitle(questions[answeredQuestionsAmount].options[3], for: [])
            
            let ratio = Float(answeredQuestionsAmount + 1) / Float(questions.count)
            questionsProgressBar.setProgress(ratio, animated: true)
            lblProgressQuestions.text = "\(answeredQuestionsAmount + 1)/\(questions.count)"
            
            resetTimer()
            
            cleanAnswerSelection()
            
            answeredQuestionsAmount += 1
            
        } else {
            RankingManagement().createOrUpdateRankingStatistics(summary: summary!)
            pauseTimer()
            showSummaryAlert()
        }
    }
    
    fileprivate func verifyCorrectness() {
        let isSelectedIndex = getSelectedOption()
        
        if isSelectedIndex.0 {
            print("\(answeredQuestionsAmount)")
            if questions[answeredQuestionsAmount - 1].isCorrect(isSelectedIndex.1) {
                summary?.sumCorrectAnswers()
            }
        } else {
            summary?.sumSkippedAnswers()
        }
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        
        verifyCorrectness()
        
        configureNextQuestion()
    }
    
    func getSelectedOption() -> (Bool, Int) {
        var selectedOption = (false, 0)
        for i in 0...3 {
            if options[i].titleLabel?.text == selectedOptionButton?.titleLabel?.text {
                selectedOption = (true, i)
            }
        }
        
        return selectedOption
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
