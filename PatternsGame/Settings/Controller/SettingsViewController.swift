//
//  SettingsViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 20.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()

    override func viewDidLoad() {
        super .viewDidLoad()
        view = settingsView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Game.shared.startGame()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            Game.shared.gameStrategy = settingsView.selectedStrategy ?? Regular()
        }
    }
    
    

}
