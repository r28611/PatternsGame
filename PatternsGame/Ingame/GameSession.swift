//
//  GameSession.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import Foundation

final class GameSession {
    
    var currentQuestionIndex: Int = 0
    var score: Int { return currentQuestionIndex * 3 }
    var questionCount = Game.shared.questions
    
}

extension GameSession: GameDelegate {
    
    func didNewLevel(with level: Int) {
        self.currentQuestionIndex = level
    }
}

