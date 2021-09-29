//
//  AddQuestionCellView.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 28.09.2021.
//

import UIKit

final class AddQuestionCellView: UIView {
    
    // MARK: - Private Properties

    internal let questionTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.textAlignment = .center
        field.placeholder = "Your question"
        return field
    }()
    
    internal let answerATextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 2
        field.placeholder = "Right answer"
        return field
    }()
    
    internal let answerBTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.placeholder = "Other answer"
        return field
    }()
    
    internal let answerCTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.placeholder = "One more answer"
        return field
    }()
    
    internal let answerDTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 1
        field.placeholder = "One more answer"
        return field
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [questionTextField, answerATextField, answerBTextField, answerCTextField, answerDTextField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 3
        return stack
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureUI() {
        backgroundColor = .white
        layer.cornerRadius = 10
        configureStackView()
    }
    
    private func configureStackView() {
        addSubview(stackView)
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: safeArea.topAnchor,
                constant: 8
            ),
            stackView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 16
            ),
            stackView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -16
            ),
            stackView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor,
                constant: -8
            )
        ])
    }
    
}
