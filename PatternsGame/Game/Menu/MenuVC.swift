//
//  MenuVC.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 20.08.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    enum Mode: Int {
        case normal
        case random
    }
    
    private var modeControl : UISegmentedControl = {
        let control = UISegmentedControl(items: ["Normal", "Random"])
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    override func viewDidLoad() {
        super .viewDidLoad()
        setupUi()
    }
    
    private func setupUi() {
        view.backgroundColor = .white
        view.addSubview(modeControl)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            modeControl.topAnchor.constraint(equalTo: margins.topAnchor),
            modeControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            modeControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            modeControl.widthAnchor.constraint(equalTo: margins.widthAnchor),
        ])
    }
}
