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
    
    var gameStrategy: GameStrategy = Regular()
    internal var level: Int = 0
    internal var results = [GameSession]()
    internal var questions: [Question] = QuestionFactory.makeQuestions()
    
    private var gameSession: GameSession?
    private let gameCaretacer = GameCaretaker()
    
    func addResult(_ result: GameSession) {
        results.append(result)
    }
    
    func clearResults() {
        results = []
    }
    
    func startGame() {
        questions = gameStrategy.defineQuestions(questions: questions)
        gameCaretacer.game = self
        gameCaretacer.restoreState()
        if let state = gameCaretacer.gameState {
            level = state.obtainedLevel + 1
        }
    }
    
    func endGame() {
        gameCaretacer.saveGame()
        gameCaretacer.gameState = nil
        if let session = gameSession {
            addResult(session)
        }
        gameSession = nil
    }
    
    func setQuestion(level: Int) -> Question {
        return questions[level]
    }
    
    func checkUserAnswer(buttonPressedIndex: Int) -> Bool {
        return questions[level].checkAnswer(userAnswer: buttonPressedIndex)
    }
    
    func nextQuestion() {
        level += 1
    }
}

