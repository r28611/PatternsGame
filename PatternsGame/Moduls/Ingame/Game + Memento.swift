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
        return GameState(level: gameSession?.level.value ?? 0,
                         isFiftyFiftyActive: gameSession?.isFiftyFiftyActive ?? true,
                         isHallHelpActive: gameSession?.isHallHelpActive ?? true,
                         isCallFriendActive: gameSession?.isCallFriendActive ?? true)
    }
    
    func restore(state: GameState?) {
        if gameSession != nil {
            gameSession?.level.value = state?.level ?? 0
            gameSession?.isFiftyFiftyActive = state?.isFiftyFiftyActive ?? true
            gameSession?.isHallHelpActive = state?.isHallHelpActive ?? true
            gameSession?.isCallFriendActive = state?.isCallFriendActive ?? true
        }
    }
}

// 2. Memento
struct GameState: Codable {
    let level: Int
    let isFiftyFiftyActive: Bool
    let isHallHelpActive: Bool
    let isCallFriendActive: Bool
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
            game?.restore(state: gameState)
        } catch {
            print(error)
        }
    }
    
    
    public enum Error: Swift.Error {
        case gameNotFound
    }
}
