//
//  GameViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 12.05.2021.
//

import UIKit

protocol GameDelegate: AnyObject {
    func didSetMaxLevel(maxLevel: Int)
    func didNewLevel(with level: Int, money: Int)
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerA: AnswerButton!
    @IBOutlet weak var answerB: AnswerButton!
    @IBOutlet weak var answerC: AnswerButton!
    @IBOutlet weak var answerD: AnswerButton!
    
    weak var gameDelegate: GameDelegate?
    private var currentGameSession = GameSession()
    private let questions = QuestionFactory.makeQuestions()
    private var currentQuestion: Question?
    private var level: Int = 0
    private var maxLevel: Int {
        get { questions.count }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.gameSession = self.currentGameSession
        self.gameDelegate = self.currentGameSession
        self.gameDelegate?.didSetMaxLevel(maxLevel: self.maxLevel)
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
    
    private func EndGame() {
        Game.shared.results.append(currentGameSession)
        Game.shared.gameSession = nil
        navigationController?.popViewController(animated: true)
    }
    
    private func hallThink() -> String {
        guard let question = currentQuestion else { return "Have no question" }
        let optionA = Int.random(in: 0...96)
        let optionB = Int.random(in: 0...(100 - optionA))
        let optionC = Int.random(in: 0...(100 - optionA - optionB))
        let optionD = 100 - optionA - optionB - optionC
        let thought: String = """
            \(question.answerOptions[0])  ........ \(optionA)%
            \(question.answerOptions[1])  ........ \(optionB)%
            \(question.answerOptions[2])  ........ \(optionC)%
            \(question.answerOptions[3])  ........ \(optionD)%
        """
        return thought
    }
    
    func showHallHelp() {
        let alert = UIAlertController(title: "Hall think that...",
                                      message: hallThink(),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //не работает - надо пофиксить контрол
    @IBAction func didSelectedHint(_ sender: HintsControl) {
        if let hint = sender.selectedHint {
            switch hint {
            case .Fifty:
                print()
            case .Hall:
                showHallHelp()
            case .Call:
                print("Call to your mom")
            }
        }
    }
    
    @IBAction func userChooseAnswer(_ sender: AnswerButton) {
        guard let question = currentQuestion,
              let userAnswer = sender.title(for: .normal) else { return }
        
        guard question.checkAnswer(userAnswer: userAnswer) else {
            EndGame()
            return
        }
        
        level += 1
        self.gameDelegate?.didNewLevel(with: level, money: 0)
        if level < maxLevel {
            setQuestionAndAnswerOptions(level: level)
        } else {
            EndGame()
        }
        
    }
}
