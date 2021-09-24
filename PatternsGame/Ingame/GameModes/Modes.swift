//
//  Modes.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 24.09.2021.
//

import Foundation

enum Mode: String, CaseIterable {
    case regular = "Regular"
    case random = "Random"
    
    init?(id : Int) {
        switch id {
        case 0: self = .regular
        case 1: self = .random
        default: return nil
        }
    }
}
