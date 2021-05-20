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
//        results = sessionCaretaker.retrieveSessions()
    }
    
    var gameSession: GameSession?
    var results = [GameSession]()
//    {
//        didSet {
//            sessionCaretaker.saveGame(sessions: self.results)
//        }
//    }
    
    func addResult(_ result: GameSession) {
        self.results.append(result)
    }
    
    func clearResults() {
        self.results = []
    }
}
