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
        self.layer.cornerRadius = self.layer.frame.height / 4
        self.backgroundColor = UIColor.lightPurple
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.darkGray, for: .selected)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        
    }
}

class AnswerButton: UIButton {
    
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

class AdditionalButton: UIButton {
    
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
        self.layer.cornerRadius = self.layer.frame.height / 4
        self.backgroundColor = UIColor.systemGray5
        self.setTitleColor(UIColor.lightPurple, for: .normal)
        self.setTitleColor(UIColor.darkGray, for: .selected)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        self.tintColor = UIColor.lightPurple
        
    }
}
