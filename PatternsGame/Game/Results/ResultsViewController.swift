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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.dataSource = self
        return tableView
    }()

    override func loadView() {
        view = tableView
    }
}

extension ResultsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description()) else {
            return UITableViewCell()
        }
//        cell.textLabel?.text = String(Game.shared.records[indexPath.row].score)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
//        Game.shared.records.count
    }
}
