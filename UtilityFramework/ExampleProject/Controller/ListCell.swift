//
//  ListCell.swift
//  ExampleProject
//
//  Created by Majumdar, Amit (US - Bengaluru) on 02/12/18.
//  Copyright © 2018 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit
import UtilityFramework

class ListCell: UITableViewCell, ReusableView  {
    
    private lazy var title: MultilineLabel = {
       let label = MultilineLabel()
       if let font = UIFont(name: "Futura-CondensedMedium", size: 17.0) {
        let fontMetrics = UIFontMetrics(forTextStyle: .headline)
          label.font = fontMetrics.scaledFont(for: font)
       }
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private lazy var descriptionLabel: MultilineLabel = {
        let label = MultilineLabel()
        if let font = UIFont(name: "Verdana", size: 14.0) {
            let fontMetrics = UIFontMetrics(forTextStyle: .body)
            label.font = fontMetrics.scaledFont(for: font)
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ListCell {
    
   private func setupAppearance() {
        addSubview(title)
        addSubview(descriptionLabel)
        applyConstraints()
    }
    
    private func applyConstraints() {
        title.anchor(topAnchor,
                     leading: leadingAnchor,
                     trailing: trailingAnchor,
                     topConstant: 15.0,
                     leadingConstant: 15.0,
                     trailingConstant: 15.0)
        descriptionLabel.anchor(title.bottomAnchor,
                                leading: leadingAnchor,
                                bottom: bottomAnchor,
                                trailing: trailingAnchor,
                                topConstant: 10.0,
                                leadingConstant: 15.0,
                                bottomConstant: 15.0,
                                trailingConstant: 15.0)
    }
    
    func setTitleAndDescription(title: String, descriptionText: String) {
        self.title.text = title
        self.descriptionLabel.text = descriptionText
    }
}
