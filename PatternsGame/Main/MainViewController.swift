//
//  ViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 11.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func didTapResults(_ sender: UIButton) {
        let viewController = ResultsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapGame(_ sender: UIButton) {
        let vc = GameViewController()
//        let mode = Mode(rawValue: difficultyControl.selectedSegmentIndex)
//        vc.gameStrategy = mode == .normal ? NormalStrategy() : RandomStrategy()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

