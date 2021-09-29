//
//  AddQuestionViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 28.09.2021.
//

import UIKit

final class AddQuestionViewController: UIViewController {
    
    private let addQuestionView = AddQuestionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = addQuestionView
    }
    
    
}

