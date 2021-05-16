//
//  HintsControl.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 15.05.2021.
//

import UIKit

class HintsControl: UIControl {
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        stackView = UIStackView(arrangedSubviews: [setFiftyFiftyButton(),
                                                   setCallFriendButton(),
                                                   setHallHelpButton()])
        stackView.frame = bounds
        addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.contentMode = .scaleToFill

    }
    
    private func setFiftyFiftyButton() -> UIButton {
        let button = AdditionalButton()
        button.setImage(UIImage(named: "phone.fill"), for: .normal)
        button.addTarget(self, action: #selector(activateHint), for: .touchUpInside)
        return button
    }
    private func setCallFriendButton() -> UIButton {
        let button = AdditionalButton()
        button.setImage(UIImage(named: "person.3.fill"), for: .normal)
        button.addTarget(self, action: #selector(activateHint), for: .touchUpInside)
        return button
    }
    private func setHallHelpButton() -> UIButton {
        let button = AdditionalButton()
        button.setImage(UIImage(named: "lightbulb.fill"), for: .normal)
        button.addTarget(self, action: #selector(activateHint), for: .touchUpInside)
        return button
    }
    
    @objc func activateHint() {
        
    }
}
