//
//  DetailsViewCells.swift
//  ExampleProject
//
//  Created by Amit Majumdar on 30/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit
import UtilityFramework

class TitleCell: DataSourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let text = datasourceItem as? String else { return }
            title.text = text
        }
    }
    private lazy var title: UILabel = {
       let label = UILabel()
       label.textAlignment = .left
       label.textColor = .black
       label.numberOfLines = 0
       label.adjustsFontForContentSizeCategory = true
       if let font = UIFont(name: "Verdana", size: 14.0) {
         let fontMetrics = UIFontMetrics(forTextStyle: .body)
         label.font = fontMetrics.scaledFont(for: font)
       }
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(title)
        title.anchor(topAnchor,
                     leading: leadingAnchor,
                     bottom: bottomAnchor,
                     trailing: trailingAnchor,
                     topConstant: 10,
                     leadingConstant: 10,
                     bottomConstant: 10,
                     trailingConstant: 10)
    }
}
