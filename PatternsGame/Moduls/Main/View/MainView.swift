//
//  MainView.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 28.09.2021.
//

import UIKit

final class MainView: UIView {
    
    var gameButton : UIButton = MainButton(text: "Start game")
    var addQuestionButton : UIButton = MainButton(text: "Add question")
    var resultsButton : UIButton = MainButton(text: "Results")
    var settingsButton : UIButton = MainButton(text: "Settings")
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [gameButton, addQuestionButton, resultsButton, settingsButton])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 48.0
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
    
    // MARK: - Private methods
    
    private func configureUI() {
        backgroundColor = .white
        addSubview(buttonsStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let margins = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 16),
            buttonsStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -48),
            buttonsStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 16),
            buttonsStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -16)
        ])
    }
}
