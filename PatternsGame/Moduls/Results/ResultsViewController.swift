//
//  ResultsViewController.swift
//  PatternsGame
//
//  Created by Margarita Novokhatskaia on 14.05.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ResultsCell.self, forCellReuseIdentifier: ResultsCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func loadView() {
        view = tableView
    }
}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultsCell.description()) as? ResultsCell else {
            return UITableViewCell()
        }
        if indexPath.row == 0 {
            cell.scoreLabel.text = "Your score"
            return cell
        }
        cell.scoreLabel.text = String(Game.shared.results[indexPath.row - 1].score)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.results.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
