//
//  Labels.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 14.05.2021.
//

import UIKit

class QuestionLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.layer.cornerRadius = self.frame.height / 4
        self.clipsToBounds = true
        self.backgroundColor = UIColor.systemGray5
        self.textColor = #colorLiteral(red: 0.5796732306, green: 0.5393779278, blue: 0.9125451446, alpha: 1)
        self.font = UIFont(name: "Chalkduster", size: 16)
    }
    
    @IBInspectable var topInset: CGFloat = 8.0
    @IBInspectable var bottomInset: CGFloat = 8.0
    @IBInspectable var leftInset: CGFloat = 8.0
    @IBInspectable var rightInset: CGFloat = 8.0

    override func drawText(in rect: CGRect) {
       let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
       get {
          var contentSize = super.intrinsicContentSize
          contentSize.height += topInset + bottomInset
          contentSize.width += leftInset + rightInset
          return contentSize
       }
    }
}

class ScoreLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    func commonInit(){
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.textColor = #colorLiteral(red: 0.5796732306, green: 0.5393779278, blue: 0.9125451446, alpha: 1)
        self.font = UIFont(name: "Chalkduster", size: 16)
        self.textAlignment = .center
        self.setProperties(borderWidth: 1.0, borderColor:UIColor.systemGray5)
    }
    func setProperties(borderWidth: Float, borderColor: UIColor) {
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
    }
}
