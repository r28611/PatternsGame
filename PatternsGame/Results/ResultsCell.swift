//
//  ResultsCell.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 14.05.2021.
//

import UIKit

class ResultsCell: UITableViewCell {
    var scoreLabel = ScoreLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        addSubview(scoreLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutScoreLabel()
    }
    
    func layoutScoreLabel() {
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            scoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            scoreLabel.widthAnchor.constraint(equalToConstant: 40),
            scoreLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
