//
//  ListViewController.swift
//  ExampleProject
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeAppearance()
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return List.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.selectionStyle = .none
        let list = List.dataSource[indexPath.row]
        cell.setTitleAndDescription(title: list.title, descriptionText: list.subtitle)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ListViewController {
    
    private func customizeAppearance() {
        view.addSubview(tableView)
        tableView.fillSuperviewWithSafeArea()
    }
}
