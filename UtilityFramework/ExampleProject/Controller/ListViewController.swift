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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setTitleAndDescription(title: "Profile",
                                    descriptionText: "Choose the Right Synonym for profile Noun OUTLINE, CONTOUR, PROFILE, SILHOUETTE mean the line that bounds and gives form to something. OUTLINE applies to a line marking the outer limits or edges of a body or mass.  traced the outline of his hand  CONTOUR stresses the quality of an outline or a bounding surface as being smooth, jagged, curving, or sharply angled. a car with flowing contours  PROFILE suggests a varied and sharply defined outline against a lighter background.  a portrait of her face in profile  SILHOUETTE suggests a shape especially of a head or figure with all detail blacked out in shadow leaving only the outline clearly defined.  photograph in silhouette against a bright sky")
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
