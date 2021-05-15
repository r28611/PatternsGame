//
//  GameSession.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import Foundation

protocol GameDelegate: AnyObject {
    func didEndGame(with score: Int, from questionCount: Int)
}

final class GameSession {
    weak var gameDelegate: GameDelegate?
    
    var score: Int = 0
    var money: Int = 0
    var questionCount: Int = 0
    var isFiftyFiftyAvailable: Bool = true
    var isCallFriendAvailable: Bool = true
    var isHallHelpAvailable: Bool = true
    
    convenience init(score: Int, questionCount: Int) {
        self.init()
        self.score = score
        self.questionCount = questionCount
    }
}
