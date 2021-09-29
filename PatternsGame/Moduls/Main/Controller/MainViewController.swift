//
//  MainViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 11.05.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        addButtonsAction()
    }

    private func addButtonsAction() {
        mainView.gameButton.addTarget(self, action: #selector(didTapGame(_:)), for: .touchUpInside)
        mainView.addQuestionButton.addTarget(self, action: #selector(didTapAddQuestion(_:)), for: .touchUpInside)
        mainView.resultsButton.addTarget(self, action: #selector(didTapResults(_:)), for: .touchUpInside)
        mainView.settingsButton.addTarget(self, action: #selector(didTapSettings(_:)), for: .touchUpInside)
    }
    
    @objc private func didTapGame(_ sender: UIButton) {
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapAddQuestion(_ sender: UIButton) {
        let vc = AddQuestionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapResults(_ sender: UIButton) {
        let viewController = ResultsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func didTapSettings(_ sender: UIButton) {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

