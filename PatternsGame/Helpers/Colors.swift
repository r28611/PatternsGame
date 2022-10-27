//
//  Colors.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 19.05.2021.
//

import UIKit

enum Colors {
    static let wrongColor = UIColor.systemYellow
    
    static let background = UIColor(named: "Board") ?? wrongColor
    static let text = UIColor(named: "Chalk") ?? wrongColor
    static let frame = UIColor(named: "BoardFrame") ?? wrongColor
    static let darkGray: UIColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
}
