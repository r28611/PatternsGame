//
//  ViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 11.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapResults(_ sender: UIButton) {
        let viewController = ResultsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

