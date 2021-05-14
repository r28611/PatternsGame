//
//  Game.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 14.05.2021.
//

import Foundation

class Game {

    static let shared = Game()

    private init() { }

    var gameSession: GameSession?
    
    var results = [GameSession]()
}
