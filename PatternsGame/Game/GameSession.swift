//
//  GameSession.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import Foundation

// 1. Originator
final class GameSession: Codable {
    
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

// 2. Memento
typealias Memento = Data

// 3. Caretaker
class SessionCaretaker {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "sessions"
    
    func saveGame(sessions: [GameSession]) {
        do {
             let data = try self.encoder.encode(sessions)
             UserDefaults.standard.set(data, forKey: key)
         } catch {
             print(error)
         }
    }
    
    func retrieveSessions() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    
    public enum Error: Swift.Error {
        case gameNotFound
    }
}
