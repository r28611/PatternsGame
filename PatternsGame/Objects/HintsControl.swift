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

class HintsControl: UIControl {
    private var stackView: UIStackView!
    private var isFiftyActive: Bool = true
    private var isHallActive: Bool = true
    private var isCallActive: Bool = true
    private var fiftyButton = AdditionalButton()
    private var hallButton = AdditionalButton()
    private var callButton = AdditionalButton()
    var selectedHint: Hints?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setFiftyFiftyButton(frame: bounds)
        setCallFriendButton(frame: bounds)
        setHallHelpButton(frame: bounds)
        stackView = UIStackView(arrangedSubviews: [fiftyButton, hallButton, callButton])
        stackView.frame = bounds
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
    }
    
    private func setFiftyFiftyButton(frame: CGRect) {
        fiftyButton = AdditionalButton(frame: frame)
        fiftyButton.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        fiftyButton.addTarget(self, action: #selector(activateFifty), for: .touchUpInside)
    }
    private func setCallFriendButton(frame: CGRect) {
        hallButton = AdditionalButton(frame: frame)
        hallButton.setImage(UIImage(systemName: "person.3.fill"), for: .normal)
        hallButton.addTarget(self, action: #selector(activateHall), for: .touchUpInside)
    }
    private func setHallHelpButton(frame: CGRect) {
        callButton = AdditionalButton(frame: frame)
        callButton.setImage(UIImage(systemName: "lightbulb.fill"), for: .normal)
        callButton.addTarget(self, action: #selector(activateCall), for: .touchUpInside)
    }
    
    @objc func activateFifty() {
        self.selectedHint = .Fifty
        self.isFiftyActive = false
        self.fiftyButton.setImage(UIImage(systemName: "nosign"), for: .normal)
    }
    
    @objc func activateHall() {
        self.selectedHint = .Hall
        self.isHallActive = false
        self.hallButton.setImage(UIImage(systemName: "nosign"), for: .normal)
    }
    
    @objc func activateCall() {
        self.selectedHint = .Call
        self.isCallActive = false
        self.callButton.setImage(UIImage(systemName: "nosign"), for: .normal)
    }
    
}
