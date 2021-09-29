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
        self.textColor = UIColor.lightPurple
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

class TitleLabel: UILabel {
    convenience init(color: UIColor, size: CGFloat) {
        self.init()
        textColor = color
        font = UIFont(name: "Chalkduster", size: size)
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
}
