//
//  GameSession.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import Foundation

final class GameSession {
    
    var level: Observable<Int> = Observable<Int>(0)
    var score: Int { return level.value * 3 }
    
}

extension GameSession: GameDelegate {
    func didNewLevel(with level: Int) {
        self.level.value = level
    }
}
