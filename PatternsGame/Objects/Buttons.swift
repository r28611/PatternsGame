//
//  Buttons.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 11.05.2021.
//

import UIKit

class AnswerButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.layer.cornerRadius = self.layer.frame.height / 4
        self.backgroundColor = #colorLiteral(red: 0.5796732306, green: 0.5393779278, blue: 0.9125451446, alpha: 1)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 24)
        
    }

}

class AdditionalButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.layer.cornerRadius = self.layer.frame.height / 4
        self.backgroundColor = UIColor.systemGray5
        self.setTitleColor(#colorLiteral(red: 0.5796732306, green: 0.5393779278, blue: 0.9125451446, alpha: 1), for: .normal)
        self.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        self.tintColor = #colorLiteral(red: 0.5796732306, green: 0.5393779278, blue: 0.9125451446, alpha: 1)
        
    }

}
