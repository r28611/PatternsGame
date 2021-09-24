//
//  SettingsView.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 24.09.2021.
//

import UIKit

final class SettingsView: UIView {
    
    var selectedMode = Mode.regular
    
    private var modeControl : UISegmentedControl = {
        let control = UISegmentedControl(items: Mode.allCases.map { $0.rawValue })
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
        addSubview(modeControl)
        
        let margins = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            modeControl.topAnchor.constraint(equalTo: margins.topAnchor),
            modeControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            modeControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            modeControl.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            backgroundColor = .yellow
            selectedMode = Mode.regular
        case 1:
            backgroundColor = .green
            selectedMode = Mode.random
        default:
            backgroundColor = .red
        }
    }
    
}
