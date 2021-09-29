//
//  QuestionsBuilder.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 29.09.2021.
//

import Foundation

class QuestionsBuilder {
    private(set) var question: String = ""
    private(set) var answerOptions: [String] = [String]()
    private(set) var rightAnswer: Int = 0
    
    func build() -> Question {
        let mixedQuestions = answerOptions.shuffled()
        for (index, answer) in mixedQuestions.enumerated() {
            if answer == answerOptions[rightAnswer] {
                rightAnswer = index
            }
        }
        return Question(question: question, answerOptions: mixedQuestions, rightAnswer: rightAnswer)
    }
    
    func setQuestion(_ question: String) -> Self {
        self.question = question
        return self
    }

    func addAnswer(_ answer: String) -> Self {
        answerOptions.append(answer)
        return self
    }
}
