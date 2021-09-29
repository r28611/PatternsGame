//
//  GameViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    private var currentGameSession = GameSession()
    private let gameView = GameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = gameView
        gameView.viewDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Game.shared.startGame()
        gameView.setupLabels(for: Game.shared.questions[Game.shared.level])
        Game.shared.gameSession?.level.addObserver(self, options: [.new, .initial], closure: { [weak self] (level, _) in
            self?.gameView.progress.setProgress((Float(level) / Float(Game.shared.questions.count)), animated: true)
        })
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
