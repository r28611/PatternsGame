//
//  HintsControl.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 15.05.2021.
//

import UIKit

class HintsControl: UIView {
    
    var gameViewController: GameViewController?
    
    private var fiftyFiftyButton: UIButton = {
        let button = AdditionalButton()
        button.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var hallHelpButton: UIButton = {
        let button = AdditionalButton()
        button.setImage(UIImage(systemName: "person.3.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var callFriendButton: UIButton = {
        let button = AdditionalButton()
        button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fiftyFiftyButton, hallHelpButton, callFriendButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addButtonsAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func configureUI() {
        backgroundColor = .white
        addSubview(stackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let margins = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }
    
    private func addButtonsAction() {
        [fiftyFiftyButton, hallHelpButton, callFriendButton].forEach {
            $0.addTarget(self, action: #selector(didHintPressed(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didHintPressed(_ sender: UIButton) {
        sender.setImage(UIImage(systemName: "nosign"), for: .normal)
        sender.isUserInteractionEnabled = false
        print(sender.description)
        switch sender {
        case hallHelpButton:
            showHallHelp(question: Game.shared.questions[Game.shared.level], controller: gameViewController)
        case fiftyFiftyButton:
            gameViewController?.gameView.setupLabels(for: Game.shared.questions[Game.shared.level].fiftyFifty())
        default:
            return
        }
    }
    
    private func showHallHelp(question: Question, controller: UIViewController?) {
        let alert = UIAlertController(title: "Hall think that right answer is",
                                      message: hallThink(question: question),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        controller?.present(alert, animated: true, completion: nil)
    }
    
    private func hallThink(question: Question) -> String {
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
}
