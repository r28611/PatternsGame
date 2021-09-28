//
//  GameViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import UIKit

protocol GameDelegate: AnyObject {
    func didNewLevel(with level: Int)
}

class GameViewController: UIViewController {
    weak var gameDelegate: GameDelegate?
    private var currentGameSession = GameSession()
    private let gameView = GameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView
        gameView.viewDelegate = self
        gameDelegate = currentGameSession
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Game.shared.startGame()
        gameView.setupLabels(for: Game.shared.questions[Game.shared.level])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            Game.shared.endGame()
        }
    }
    
    // MARK: - Private methods
    
    private func endGame() {
        Game.shared.endGame()
        navigationController?.popViewController(animated: true)
    }
    
    private func nextQuestion() {
        Game.shared.nextQuestion()
        gameView.setupLabels(for: Game.shared.questions[Game.shared.level])
    }
}

extension GameViewController: GameViewDelegate {
    func didPressAnswer(_ sender: AnswerButton) {
        Game.shared.checkUserAnswer(buttonPressedIndex: sender.index) && !Game.shared.isLastQuestion() ? nextQuestion() : endGame()
    }
}
