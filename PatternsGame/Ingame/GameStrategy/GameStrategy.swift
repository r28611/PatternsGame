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

class Regular: GameStrategy {
    func defineQuestions(questions: [Question]) -> [Question] {
        return questions
    }
}

class Random: GameStrategy {
    func defineQuestions(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}

extension GameStrategy {
    static var strategyName: String {
        return String(describing: self)
    }
}
