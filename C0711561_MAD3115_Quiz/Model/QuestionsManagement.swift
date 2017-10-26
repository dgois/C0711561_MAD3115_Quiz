//
//  QuestionsManagement.swift
//  C0711561_MAD3115_Quiz
//
//  Created by MacStudent on 2017-10-26.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation

class QuestionsManagement {
    
    var questions: [Question] = [Question]()
    
    init() {
        questions = createQuestions()
    }
    
    func getQuestionList() -> [Question] {
        var questionList = [Question]()
        
        var numbers = Set<Int>()
        while numbers.count < 10 {
            let randomQuesIndex = Int((arc4random() % 20));
            if numbers.insert(randomQuesIndex).inserted {
                questionList.append(questions[randomQuesIndex])
            }
        }
        
        return questionList
    }
    
    fileprivate func createQuestions() -> [Question] {
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
            Question(statement: "What did Brazil gain independence from?",
                     options: ["Portugal", "Spain", "Germany", "Norway"],
                     correctOptionIndex: 0),
            Question(statement: "What two countries doesn't Brazil border in South America?",
                     options: ["Argentina and Peru", "Ecuador and Chile", "Bolivia and Paraguay", "Ecuador and Bolivia"],
                     correctOptionIndex: 1),
            Question(statement: "What ocean borders Brazil?",
                     options: ["Pacific", "Atlantic", "Indian", "Ontario"],
                     correctOptionIndex: 1),
            Question(statement: "What is the capital of Brazil?",
                     options: ["Brasilla", "Brazil City", "Sao Paulo", "Rio"],
                     correctOptionIndex: 0	),
            Question(statement: "What continent is Brazil on?",
                     options: ["North America", "Asia", "South America", "Europe"],
                     correctOptionIndex: 2),
            Question(statement: "The money or currency of Brazil is:",
                     options: ["Dollar", "Won", "Penny", "Real"],
                     correctOptionIndex: 3),
            Question(statement: "What is the language of Brazil?",
                     options: ["English", "Spanish", "Portuguese", "French"],
                     correctOptionIndex: 2),
            Question(statement: "What is Brazil famous for",
                     options: ["Oil and french fries", "Oranges", "Soup and noodles", "Mardi Gras and coffee"],
                     correctOptionIndex: 1),
            Question(statement: "What famous river is in Brazil?",
                     options: ["Mississippi", "Ontario", "Brazil River", "Amazon River"],
                     correctOptionIndex: 2),
            Question(statement: "What is large City in Brazil?",
                     options: ["Rio de Janeiro", "Sao Paulo", "Vitoria", "Recife"],
                     correctOptionIndex: 1),
            Question(statement: "The most popular sport in Brazil is:",
                     options: ["Baseball", "Basketball", "Swimming", "Soccer"],
                     correctOptionIndex: 3),
            Question(statement: "What kind of region is Brazil in?",
                     options: ["Desert", "Cold and snowy", "Rainforest", "Cold and icy"],
                     correctOptionIndex: 2),
            Question(statement: "Football (soccer) is a passion of the Brazilian people. How many times has the country won the FIFA World Cup?",
                     options: ["Six", "Five", "Four", "Three"],
                     correctOptionIndex: 1),
            Question(statement: "In what month do the world-famous Carnaval festivities happen in Brazil?",
                     options: ["February", "January", "July", "December"],
                     correctOptionIndex: 0),
            Question(statement: "What type of dance occurs at pagodes kind of Brasilian music?",
                     options: ["Maxixe", "Lundu", "Samba", "Hip Hop"],
                     correctOptionIndex: 2),
            Question(statement: "What aspect of Brazilian culture began to be very important in the 19th century?",
                     options: ["Musical Nationalism", "The sharing of food and wealth", "Sacrifices to the deities", "The overpowerment of favelas"],
                     correctOptionIndex: 3),
            Question(statement: "To whom was musical nationalism most important?",
                     options: ["Gilberto Gil", "Joao Gilberto", "Villa-Lobos", "Caetano Veloso"],
                     correctOptionIndex: 2),
        ]
        
        return questions
    }
}
