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
    
    let tapRec = UITapGestureRecognizer()
    
    var seconds = 10
    var questions: [Question] = [Question]()
    var options = [UIButton]()
    var timer = Timer()
    var questionIndex = 0
    var summary: EndQuizSummary?
    var selectedOptionButton: UIButton?
    var myUserDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationButton()
        runTimer()
        getQuestions()
        cleanAnswerSelection()
        configureNextQuestion()
        
        summary = EndQuizSummary(totalQuestions: questions.count)
        
        tapRec.addTarget(self, action: #selector(self.tappedLabel))
    }
    
    @objc func tappedLabel() {
        print("Its workiggggggg!")
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        verifyCorrectness()
        configureNextQuestion()
    }
    
    @IBAction func selectOption(_ sender: UIButton) {
        options.forEach { (button) in
            button.backgroundColor = UIColor.white
        }
        sender.backgroundColor = UIColor.yellow
        selectedOptionButton = sender
    }
    
    fileprivate func hideNavigationButton() {
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
    
    fileprivate func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(QuestionViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    fileprivate func getQuestions() {
        questions = QuestionsManagement().getQuestionList()
    }
    
    fileprivate func cleanAnswerSelection() {
        options = [optionOne, optionTwo, optionTree, optionFour]
        options.forEach { (button) in
            button.backgroundColor = UIColor.white
        }
        selectedOptionButton = nil
    }
    
    fileprivate func configureNextQuestion() {
        if (reachEndOfTheQuiz()) {
            displayQuestions()
            updateProgressViewAndLabel()
            resetTimer()
            cleanAnswerSelection()
            questionIndex += 1
            
        } else {
            RankingManagement().createOrUpdateRankingStatistics(summary: summary!)
            pauseTimer()
            showSummaryAlert()
        }
    }
    
    fileprivate func reachEndOfTheQuiz() -> Bool {
        return questionIndex < questions.count
    }
    
    fileprivate func displayQuestions() {
        lblQuestionStatement.text = "\(questionIndex + 1) - \(questions[questionIndex].statement)"
        
        optionOne.setTitle(questions[questionIndex].options[0], for: [])
        optionTwo.setTitle(questions[questionIndex].options[1], for: [])
        optionTree.setTitle(questions[questionIndex].options[2], for: [])
        optionFour.setTitle(questions[questionIndex].options[3], for: [])
    }
    
    fileprivate func updateProgressViewAndLabel() {
        let ratio = Float(questionIndex + 1) / Float(questions.count)
        questionsProgressBar.setProgress(ratio, animated: true)
        lblProgressQuestions.text = "\(questionIndex + 1)/\(questions.count)"
    }
    
    fileprivate func resetTimer() {
        timer.invalidate()
        seconds = 10
        lblTimer.text = "\(seconds)"
        lblTimer.textColor = .black
        runTimer()
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
                self.performSegue(withIdentifier: "rankingSceneSegueFromSummary", sender: nil)
            }
        }
        
        summaryAlertViewController.addAction(okAction)
        summaryAlertViewController.addAction(rankingActin)
        
        self.present(summaryAlertViewController, animated: true, completion: nil)
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
    
    fileprivate func pauseTimer() {
        timer.invalidate()
    }
    
    fileprivate func verifyCorrectness() {
        let selectedOptionOrSkipped = getSelecedOptionOrSkipped()
        
        if selectedOptionOrSkipped.isSelected {
            if questions[questionIndex - 1].isCorrect(selectedOptionOrSkipped.selectedOption) {
                summary?.sumCorrectAnswers()
            }
        } else {
            summary?.sumSkippedAnswers()
        }
    }
    
    fileprivate func getSelecedOptionOrSkipped() -> (isSelected: Bool, selectedOption: Int) {
        var selectedOption = (false, 0)
        for i in 0...3 {
            if options[i].titleLabel?.text == selectedOptionButton?.titleLabel?.text {
                selectedOption = (true, i)
            }
        }
        
        return selectedOption
    }
}
