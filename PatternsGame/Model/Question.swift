//
//  Question.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import Foundation

struct Question {
    let question: String
    let answerOptions: [String]
    let rightAnswer: Int
    
    func checkAnswer(userAnswer: Int) -> Bool {
        return userAnswer == rightAnswer
    }
    
    func fiftyFifty() -> Question {
        var newAnswers = ["", "", "", ""]
        var oldAnswers = answerOptions
        newAnswers[rightAnswer] = answerOptions[rightAnswer]
        oldAnswers.remove(at: rightAnswer)
        let randomAnswer = oldAnswers[Int.random(in: 0..<oldAnswers.count)]
        
        for (i, _) in answerOptions.enumerated() {
            if randomAnswer == answerOptions[i] {
                newAnswers[i] = randomAnswer
            }
        }
        return Question(question: question, answerOptions: newAnswers, rightAnswer: rightAnswer)
    }
}

var questionsList: [Question] = [
    Question(
        question: "A magnet would most likely attract which of the following?",
        answerOptions: ["Metal", "Plastic", "Wood", "The wrong man"],
        rightAnswer: 0),
    Question(
        question: "Where did Scotch whisky originate?",
        answerOptions: ["Ireland", "Wales", "The United States", "Scotland"],
        rightAnswer: 3),
    Question(
        question: "In the United States, what is traditionally the proper way to address a judge?",
        answerOptions: ["Your holiness", "Your honor", "Your eminence", "You da man!"],
        rightAnswer: 1),
    Question(
        question: "In which of these films does Whoopi Goldberg dress up as a nun?",
        answerOptions: ["Sister Act", "Ghost", "The Color Purple", "How Judas Got His Groove Back"],
        rightAnswer: 0),
    Question(
        question: "A person who is not a banker and lends money at an extremely high interest rate is known as what?",
        answerOptions: ["Paper tiger", "Green snake", "Loan shark", "Brother-in-law"],
        rightAnswer: 2)
]

