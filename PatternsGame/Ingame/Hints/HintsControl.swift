//
//  HintsControl.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 15.05.2021.
//

import UIKit

enum Hints {
    case Fifty, Hall, Call
}

class HintsControl: UIView {
    
    private var isFiftyActive: Bool = true
    private var isHallActive: Bool = true
    private var isCallActive: Bool = true
    
    private var fiftyButton: UIButton = {
        let button = AdditionalButton()
        button.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
        button.addTarget(self, action: #selector(activateFifty), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var hallButton: UIButton = {
        let button = AdditionalButton()
        button.setImage(UIImage(systemName: "person.3.fill"), for: .normal)
        button.addTarget(self, action: #selector(activateHall), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var callButton: UIButton = {
        let button = AdditionalButton()
        button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        button.addTarget(self, action: #selector(activateCall), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fiftyButton, hallButton, callButton])
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
    
    @objc func activateFifty() {
        isFiftyActive = false
        fiftyButton.isUserInteractionEnabled = false
        fiftyButton.setImage(UIImage(systemName: "nosign"), for: .normal)
        print("User took Fifty Fifty hint")

    }
    
    @objc func activateHall() {
        isHallActive = false
        hallButton.isUserInteractionEnabled = false
        hallButton.setImage(UIImage(systemName: "nosign"), for: .normal)
        print("User took Hall Help hint")
    }
    
    @objc func activateCall() {
        isCallActive = false
        callButton.isUserInteractionEnabled = false
        callButton.setImage(UIImage(systemName: "nosign"), for: .normal)
        print("User took Call a friend hint")
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
    
    func showHallHelp(question: Question, controller: UIViewController) {
        let alert = UIAlertController(title: "Hall think that...",
                                      message: hallThink(question: question),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        controller.present(alert, animated: true, completion: nil)
    }
    
}
