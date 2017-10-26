//
//  EndQuizSummary.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-25.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation

class EndQuizSummary {
    
    private var _totalQuestions: Int
    
    var totalQuestions: Int {
        return _totalQuestions
    }
    
    private var _correctAnswers: Int = 0
    
    var correctAnswers: Int {
        return _correctAnswers
    }
    
    private var _skippedAnswers: Int = 0
    
    var skippedAnswers: Int {
        return _skippedAnswers
    }
    
    var wrongAnswers: Int {
        return _totalQuestions - (_correctAnswers + _skippedAnswers)
    }
    
    init(totalQuestions: Int) {
        self._totalQuestions = totalQuestions
    }
    
    func sumCorrectAnswers() {
        _correctAnswers += 1
    }
    
    func sumSkippedAnswers() {
        _skippedAnswers += 1
    }
    
    func getSummaryText() -> String {
        return "Total Questions: \(_totalQuestions)\n Correct: \(_correctAnswers)\n Skipped: \(_skippedAnswers)\n Wrong: \(wrongAnswers)"
    }
}
