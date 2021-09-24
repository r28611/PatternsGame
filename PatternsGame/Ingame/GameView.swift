//
//  GameView.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 23.09.2021.
//

import UIKit

final class GameView: UIView {
    
    private var questionLabel: UILabel = {
        let label = QuestionLabel()
        label.numberOfLines = 0
        label.text = "Тут будет вопрос."
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var buttonA : UIButton = createAnswerButton(title: "A")
    private var buttonB : UIButton = createAnswerButton(title: "B")
    private var buttonC : UIButton = createAnswerButton(title: "C")
    private var buttonD : UIButton = createAnswerButton(title: "D")
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonA, buttonB, buttonC, buttonD])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func configureUI() {
        backgroundColor = .white
        addSubview(questionLabel)
        addSubview(buttonsStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let margins = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            questionLabel.widthAnchor.constraint(equalTo: margins.widthAnchor),
        
            buttonsStackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 128),
            buttonsStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 8),
            buttonsStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8),
            buttonsStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -8),
        ])
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
