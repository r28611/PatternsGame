//
//  GameSession.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import Foundation

final class GameSession {
    
    var level: Int = 0
    var score: Int { return level * 3 }
    var questionCount = Game.shared.questions.count
    
}

extension GameSession: GameDelegate {
    func didNewLevel(with level: Int) {
        self.level = level
    }
}

