//
//  Buttons.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 11.05.2021.
//

import UIKit

final class MainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init(text: String) {
        self.init()
        setTitle(text, for: .normal)
    }

    private func setup() {
        self.backgroundColor = Colors.background
        layer.borderColor = Colors.frame.cgColor
        layer.borderWidth = 12
        self.setTitleColor(Colors.text, for: .normal)
        self.setTitleColor(Colors.darkGray, for: .selected)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        
    }
}

final class AnswerButton: UIButton {
    
    var index: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init(buttonIndex: Int) {
        self.init()
        index = buttonIndex
    }
    
    private func commonInit() {
        self.backgroundColor = Colors.background
        self.setTitleColor(Colors.text, for: .normal)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 24)
    }

}

final class AdditionalButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init(text: String) {
        self.init()
        setTitle(text, for: .normal)
    }

    private func setup() {
        self.backgroundColor = UIColor.systemGray5
        self.setTitleColor(Colors.background, for: .normal)
        self.setTitleColor(Colors.darkGray, for: .selected)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        self.tintColor = Colors.background
        
    }
}
