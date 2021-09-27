//
//  SettingsView.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 24.09.2021.
//

import UIKit

final class SettingsView: UIView {
    
    var selectedStrategy: GameStrategy?
    
    private var strategyControl : UISegmentedControl = {
        let control = UISegmentedControl(items: [Regular.strategyName, Random.strategyName])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    
    private func configureView() {
        backgroundColor = .white
        addSubview(strategyControl)
        
        let margins = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            strategyControl.topAnchor.constraint(equalTo: margins.topAnchor),
            strategyControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            strategyControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            strategyControl.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            backgroundColor = .yellow
            selectedStrategy = Regular()
        case 1:
            backgroundColor = .green
            selectedStrategy = Random()
        default:
            backgroundColor = .red
        }
    }
    
}
