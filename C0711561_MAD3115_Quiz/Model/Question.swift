//
//  Question.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-23.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation

class Question {
    var statement: String?
    var options: [String]?
    var correctOptionIndex: Int?
    
    init(statement statement: String, options options: [String], correctOptionIndex correctOptionIndex: Int) {
        self.statement = statement
        self.options = options
        self.correctOptionIndex = correctOptionIndex
    }
    
    func isCorrect(_ selectedIndex: Int) -> Bool {
        return correctOptionIndex == selectedIndex
    }
}
