//
//  Game.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 14.05.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    private init() {
    }
    
    internal var results = [GameSession]()
    internal var gameSession: GameSession?
    internal var questions = QuestionFactory.makeQuestions()
    
    var mode = Mode.regular
    
    func addResult(_ result: GameSession) {
        self.results.append(result)
    }
    
    func clearResults() {
        self.results = []
    }
}
