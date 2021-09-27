//
//  GameView.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 23.09.2021.
//

import UIKit

final class GameView: UIView {
    
    private var progress: UIProgressView = {
        let view = UIProgressView()
        view.tintColor = UIColor.lightPurple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var questionLabel: UILabel = {
        let label = QuestionLabel()
        label.numberOfLines = 0
        label.text = "Тут будет вопрос."
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hintsControl: UIView = {
       let control = HintsControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    var buttonA : UIButton = AnswerButton(buttonIndex: 0)
    var buttonB : UIButton = AnswerButton(buttonIndex: 1)
    var buttonC : UIButton = AnswerButton(buttonIndex: 2)
    var buttonD : UIButton = AnswerButton(buttonIndex: 3)
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonA, buttonB, buttonC, buttonD])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabels(for question: Question) {
        questionLabel.text = question.question
        [buttonA, buttonB, buttonC, buttonD].enumerated().forEach { (index, item) in
            item.setTitle(question.answerOptions[index], for: .normal)
        }
    }
    
    @objc func userAnswerTapped(_ sender: AnswerButton) {
        print(String(sender.index))
        // надо добавить делегат view controller, не понимаю как
        Game.shared.checkUserAnswer(buttonPressedIndex: sender.index) ? Game.shared.nextQuestion() : Game.shared.endGame()
    }
    
    // MARK: - Private methods
    
    private func configureUI() {
        backgroundColor = .white
        addSubview(progress)
        addSubview(questionLabel)
        addSubview(hintsControl)
        addSubview(buttonsStackView)
        setupConstraints()
        addButtonAction()
    }
    
    private func setupConstraints() {
        let margins = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            progress.topAnchor.constraint(equalTo: margins.topAnchor),
            progress.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8),
            progress.trailingAnchor.constraint(equalTo: margins.trailingAnchor,  constant: -8),
            progress.heightAnchor.constraint(equalToConstant: 8),
            
            questionLabel.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 48),
            questionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            hintsControl.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 48),
            hintsControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            hintsControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            hintsControl.heightAnchor.constraint(equalToConstant: 58),

            buttonsStackView.topAnchor.constraint(equalTo: hintsControl.bottomAnchor, constant: 48),
            buttonsStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 8),
            buttonsStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8),
            buttonsStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -8),
        ])
    }
    
    private func addButtonAction() {
        [buttonA, buttonB, buttonC, buttonD].forEach { button in
            button.addTarget(self, action: #selector(userAnswerTapped(_:)), for: .touchUpInside)
        }
    }
}
