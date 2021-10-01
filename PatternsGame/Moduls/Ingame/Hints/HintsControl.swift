//
//  HintsControl.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 15.05.2021.
//

import UIKit

class HintsControl: UIView {
    
    var gameViewController: GameViewController?
    // MARK: - Private properties
    
    private var fiftyFiftyImage: String {
        var image = String()
        guard let sessin = Game.shared.gameSession else { return "lightbulb.fill" }
        image = sessin.isFiftyFiftyActive ? "lightbulb.fill" : "nosign"
        return image
    }
    
    private var hallHelpImage: String {
        var image = String()
        guard let sessin = Game.shared.gameSession else { return "lightbulb.fill" }
        image = sessin.isHallHelpActive ? "person.3.fill" : "nosign"
        return image
    }
    
    private var callFriendImage: String {
        var image = String()
        guard let sessin = Game.shared.gameSession else { return "lightbulb.fill" }
        image = sessin.isCallFriendActive ? "phone.fill" : "nosign"
        return image
    }
    
    private var fiftyFiftyButton: UIButton = {
        let button = AdditionalButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var hallHelpButton: UIButton = {
        let button = AdditionalButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var callFriendButton: UIButton = {
        let button = AdditionalButton()
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
    
    
    public func rebuildButtons() {
        setupButtonsImage()
        checkButtonsEnabled()
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
    
    private func setupButtonsImage() {
        fiftyFiftyButton.setImage(UIImage(systemName: fiftyFiftyImage), for: .normal)
        hallHelpButton.setImage(UIImage(systemName: hallHelpImage), for: .normal)
        callFriendButton.setImage(UIImage(systemName: callFriendImage), for: .normal)
    }
    
    private func checkButtonsEnabled() {
        guard let sessin = Game.shared.gameSession else { return }
        fiftyFiftyButton.isUserInteractionEnabled = sessin.isFiftyFiftyActive
        hallHelpButton.isUserInteractionEnabled = sessin.isHallHelpActive
        callFriendButton.isUserInteractionEnabled = sessin.isCallFriendActive
    }
    
    private func addButtonsAction() {
        [fiftyFiftyButton, hallHelpButton, callFriendButton].forEach {
            $0.addTarget(self, action: #selector(didHintPressed(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func didHintPressed(_ sender: UIButton) {
        let question = Game.shared.questions[Game.shared.level]
        sender.setImage(UIImage(systemName: "nosign"), for: .normal)
        sender.isUserInteractionEnabled = false
        switch sender {
        case fiftyFiftyButton:
            gameViewController?.gameView.setupLabels(for: question.fiftyFifty())
            Game.shared.gameSession?.isFiftyFiftyActive = false
        case hallHelpButton:
            showHallHelp(question: question, controller: gameViewController)
            Game.shared.gameSession?.isHallHelpActive = false
        case callFriendButton:
            shawFrienfsHint(options: question.answerOptions, controller: gameViewController)
            Game.shared.gameSession?.isCallFriendActive = false
        default:
            return
        }
    }
    
    private func shawFrienfsHint(options: [String], controller: UIViewController?) {
        let alert = UIAlertController(title: "Calling a friend...",
                                      message: { options[Int.random(in: 0..<options.count)] }(),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Thanks!", comment: "Default action"), style: .default))
        controller?.present(alert, animated: true, completion: nil)
    }
    
    private func showHallHelp(question: Question, controller: UIViewController?) {
        let alert = UIAlertController(title: "Hall think that right answer is",
                                      message: hallThink(question: question),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
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
