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
        addQuestionView.viewDelegate = self
    }
    
}

extension AddQuestionViewController: AddQuestionViewDelegate {
    func didPressSave(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
