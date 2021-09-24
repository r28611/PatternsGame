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
    
    var gameStrategy: GameStrategy?
    weak var gameDelegate: GameDelegate?
    private let gameCaretacer = GameCaretaker()
    private var currentGameSession = GameSession()
    
    private var questions = QuestionFactory.makeQuestions()
    private var currentQuestion: Question?
    private var level: Int = 0
    private var maxLevel: Int {
        get { questions.count }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        gameCaretacer.game = self
        gameCaretacer.restoreState()
        Game.shared.gameSession = currentGameSession
        self.gameDelegate = currentGameSession
        questions = gameStrategy?.defineQuestions(questions: questions) ?? questions
    }
    
    private func setupUi() {
        view = GameView()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let state = gameCaretacer.gameState {
            level = state.obtainedLevel + 1
        }
        setQuestionAndAnswerOptions(level: level)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setQuestionAndAnswerOptions(level: Int) {
        currentQuestion = questions[0] // Что-то не так работает, разобраться
        guard let question = currentQuestion else { return }
        let answers = question.answerOptions
//        [answerA, answerB, answerC,answerD].enumerated().forEach { $0.element.setTitle(answers[$0.offset], for: .normal) }
    }
    
    private func endGame() {
        gameCaretacer.saveGame()
        gameCaretacer.gameState = nil
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
            endGame()
            return
        }
        
        level += 1
        gameDelegate?.didNewLevel(with: level)
        if level < maxLevel {
            setQuestionAndAnswerOptions(level: level)
        } else {
            endGame()
        }
        
    }
}

// 1. Originator
extension GameViewController {
    
    func save() -> GameState {
        return GameState(obtainedLevel: level)
    }
    
    func restore(state: GameState?) {
        level = state?.obtainedLevel ?? 0
    }
}

// Memento
struct GameState: Codable {
    let obtainedLevel: Int
}


// 3. Caretaker
class GameCaretaker {
    
    weak var game: GameViewController?
    var gameState: GameState?
    
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
            gameState = try self.decoder.decode(GameState.self, from: data)
        } catch {
            print(error)
        }
    }
    
    
    public enum Error: Swift.Error {
        case gameNotFound
    }
}
