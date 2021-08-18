//
//  GameStrategy.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 17.08.2021.
//

import Foundation

protocol GameStrategy {
    func defineQuestions(questions: [Question]) -> [Question]
}

class NormalStrategy: GameStrategy {
    func defineQuestions(questions: [Question]) -> [Question] {
        return questions
    }
}

class RandomStrategy: GameStrategy {
    func defineQuestions(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}
