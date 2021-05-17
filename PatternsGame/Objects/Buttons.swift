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
        self.backgroundColor = #colorLiteral(red: 0.5796732306, green: 0.5393779278, blue: 0.9125451446, alpha: 1)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 24)
    }

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
        self.setTitleColor(#colorLiteral(red: 0.5796732306, green: 0.5393779278, blue: 0.9125451446, alpha: 1), for: .normal)
        self.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .selected)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        self.tintColor = #colorLiteral(red: 0.5796732306, green: 0.5393779278, blue: 0.9125451446, alpha: 1)
        
    }
}
