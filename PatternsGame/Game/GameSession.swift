//
//  GameSession.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import Foundation

final class GameSession {
    
    var score: Int = 0
    var money: Int = 0
    var questionCount: Int = 0
    var isFiftyFiftyAvailable: Bool = true
    var isCallFriendAvailable: Bool = true
    var isHallHelpAvailable: Bool = true
    
    convenience init(questionCount: Int) {
        self.init()
        self.questionCount = questionCount
    }
}

extension GameSession: GameDelegate {
    func didSetMaxLevel(maxLevel: Int) {
        self.questionCount = maxLevel
    }
    
    func didNewLevel(with level: Int, money: Int) {
        self.score = level
        self.money = money
    }
}
