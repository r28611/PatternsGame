//
//  AddQuestionView.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 29.09.2021.
//

import UIKit

protocol AddQuestionViewDelegate: AnyObject {
    func didPressSave(_ sender: UIButton)
}

final class AddQuestionView: UIView {
    
    weak var viewDelegate: AddQuestionViewDelegate?
    
    private var cellCount = 1
    
    // MARK: - Private properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(AddQuestionCell.self, forCellReuseIdentifier: AddQuestionCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let addCellButton : UIButton = MainButton(text: "+")
    private let saveButton : UIButton = MainButton(text: "Save questions")
    
    private lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [addCellButton, saveButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillProportionally
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
        configureTableView()
        configureStackView()
        setupButtonsAction()
    }
    
    private func configureTableView() {
        addSubview(tableView)
        tableView.backgroundColor = Colors.background
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,
                                              constant: -50)
        ])
    }
    
    private func configureStackView() {
        addSubview(horizontalStackView)
        horizontalStackView.backgroundColor = Colors.background
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
    }
    
    private func setupButtonsAction() {
        addCellButton.addTarget(self, action: #selector(addCell(_:)), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveQuestions(_:)), for: .touchUpInside)
    }
    
    @objc private func addCell(_ sender: UIButton) {
        if let cell = tableView.cellForRow(at: IndexPath(row: cellCount - 1, section: 0)) as? AddQuestionCell,
           !cell.isTextFieldsEmpty() {
            cellCount += 1
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: cellCount - 1, section: 0)], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    @objc private func saveQuestions(_ sender: UIButton) {
        for index in 0...cellCount {
            if let question = makeQuestion(from: index) {
                questionsList.append(question)
            }
        }
        self.viewDelegate?.didPressSave(sender)
    }
    
    private func makeQuestion(from cell: Int) -> Question? {
        if let cell = tableView.cellForRow(at: IndexPath(row: cell, section: 0)) as? AddQuestionCell,
           !cell.isTextFieldsEmpty() {
            return QuestionsBuilder()
                .setQuestion(cell.addQuesionCellView.questionTextField.text!)
                .addAnswers([
                    cell.addQuesionCellView.answerATextField.text!,
                    cell.addQuesionCellView.answerBTextField.text!,
                    cell.addQuesionCellView.answerCTextField.text!,
                    cell.addQuesionCellView.answerDTextField.text!
                ])
                .build()
        }
        return nil
    }
}

extension AddQuestionView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddQuestionCell.description()) as? AddQuestionCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellCount
    }
}
