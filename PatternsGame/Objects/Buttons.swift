//
//  Buttons.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 11.05.2021.
//

import UIKit

class AnswerButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.layer.cornerRadius = self.layer.frame.height / 4
        self.backgroundColor = UIColor.lightPurple
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 24)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.layer.frame.height / 4
    }

}

func createAnswerButton(title: String) -> AnswerButton {
    let button = AnswerButton()
    button.setTitle(title, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}

class AdditionalButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        self.layer.cornerRadius = self.layer.frame.height / 4
        self.backgroundColor = UIColor.systemGray5
        self.setTitleColor(UIColor.lightPurple, for: .normal)
        self.setTitleColor(UIColor.darkGray, for: .selected)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        self.tintColor = UIColor.lightPurple
        
    }
}
