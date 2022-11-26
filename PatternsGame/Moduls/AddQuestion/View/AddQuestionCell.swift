//
//  AddQuestionCell.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 29.09.2021.
//

import UIKit

final class AddQuestionCell: UITableViewCell {
    
    // MARK: - Private Properties
    
    internal lazy var addQuesionCellView: AddQuestionCellView = {
        let view = AddQuestionCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureUI () {
        backgroundColor = Colors.background
        configureContentView()
        configureMainView()
    }
    
    private func configureContentView () {
        contentView.backgroundColor = Colors.background
    }
    
    private func configureMainView () {
        let safeArea = contentView.safeAreaLayoutGuide
        contentView.addSubview(addQuesionCellView)
        
        NSLayoutConstraint.activate([
            addQuesionCellView.topAnchor.constraint(
                equalTo: safeArea.topAnchor,
                constant: 8
            ),
            addQuesionCellView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                                        constant: 8),
            addQuesionCellView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                         constant: -8),
            addQuesionCellView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,
                                                       constant: -8)
        ])
    }
    
    func isTextFieldsEmpty() -> Bool {
        if let q = addQuesionCellView.questionTextField.text, q.count > 0,
           let a = addQuesionCellView.answerATextField.text, a.count > 0,
           let b = addQuesionCellView.answerBTextField.text, b.count > 0,
           let c = addQuesionCellView.answerCTextField.text, c.count > 0,
           let d = addQuesionCellView.answerDTextField.text, d.count > 0 {
            return false
        } else {
            return true
        }
    }
}
