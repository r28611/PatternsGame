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
        gameDelegate = currentGameSession
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Game.shared.startGame()
        gameView.setupLabels(for: Game.shared.questions[Game.shared.level])
    }
    
    private func endGame() {
        Game.shared.endGame()
        navigationController?.popViewController(animated: true)
    }
    
    func userChooseAnswer(_ sender: AnswerButton) {
    }
}
