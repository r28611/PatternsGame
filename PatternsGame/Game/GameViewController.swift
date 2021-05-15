//
//  GameViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerA: AnswerButton!
    @IBOutlet weak var answerB: AnswerButton!
    @IBOutlet weak var answerC: AnswerButton!
    @IBOutlet weak var answerD: AnswerButton!
    private var currentGameSession = GameSession()
    private let questions = QuestionFactory.makeQuestions()
    private var currentQuestion: Question?
    private var level: Int = 0
    private var maxLevel: Int {
        get { questions.count}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.gameSession = self.currentGameSession
        currentGameSession.gameDelegate = self
        setQuestionAndAnswerOptions(level: self.level)
        questionLabel.numberOfLines = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setQuestionAndAnswerOptions(level: Int) {
        currentQuestion = questions[level]
        guard let question = currentQuestion else { return }
        questionLabel.text = question.question
        let answers = question.answerOptions
        self.answerA.setTitle(answers[0], for: .normal)
        self.answerB.setTitle(answers[1], for: .normal)
        self.answerC.setTitle(answers[2], for: .normal)
        self.answerD.setTitle(answers[3], for: .normal)
    }
    
    @IBAction func userChooseAnswer(_ sender: AnswerButton) {
        guard let question = currentQuestion,
              let userAnswer = sender.title(for: .normal) else { return }
        
        if question.checkAnswer(userAnswer: userAnswer) && level < maxLevel - 1 {
            level += 1
            setQuestionAndAnswerOptions(level: level)
        } else {
            didEndGame(with: level + 1, from: maxLevel)
        }
    }
}

extension GameViewController: GameDelegate {
    func didEndGame(with score: Int, from questionCount: Int) {
        navigationController?.popViewController(animated: true)
        Game.shared.results.append(GameSession(score: score, questionCount: questionCount))
        Game.shared.gameSession = nil
    }
}
