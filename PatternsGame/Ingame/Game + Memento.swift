//
//  Game + Memento.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 24.09.2021.
//

import Foundation


// 1. Originator
extension Game {
    
    func save() -> GameState {
        return GameState(level: gameSession?.level ?? 0)
    }
    
    func restore(state: GameState?) {
        if gameSession != nil {
            gameSession?.level = state?.level ?? 0
        }
    }
}

// Memento
struct GameState: Codable {
    let level: Int
}


// 3. Caretaker
class GameCaretaker {
    
    weak var game: Game?
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "sessionState"
    
    func saveGame() {
        do {
            let data = try self.encoder.encode(game?.save())
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func restoreState() {
        guard let data = UserDefaults.standard.data(forKey: key) else { return }
        do {
            let gameState = try self.decoder.decode(GameState.self, from: data)
//            game.
        } catch {
            print(error)
        }
    }
    
    
    public enum Error: Swift.Error {
        case gameNotFound
    }
}
