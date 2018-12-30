//
//  DefaultCell.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 30/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit

class DefaultCell: DataSourceCell {
   
    private let defaultSpacing: CGFloat = 10.0
    
    override var datasourceItem: Any? {
        didSet {
            if let text = datasourceItem as? String {
                label.text = text
            } else {
                label.text = datasourceItem.debugDescription
            }
        }
    }
    
    let label = UILabel()
    
    override func setupViews() {
        super.setupViews()
        addSubview(label)
        label.anchor(topAnchor,
                     leading: leadingAnchor,
                     bottom: bottomAnchor,
                     trailing: trailingAnchor,
                     leadingConstant: defaultSpacing,
                     trailingConstant: defaultSpacing)
    }
}

class DefaultHeader: DefaultCell {
    
    override var datasourceItem: Any? {
        didSet {
            if datasourceItem == nil {
                label.text = "This is the default header"
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        label.text = "Header Cell"
        label.textAlignment = .center
    }
}

class DefaultFooter: DefaultCell {
    
    override var datasourceItem: Any? {
        didSet {
            if datasourceItem == nil {
                label.text = "This is the default footer"
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        label.text = "Footer Cell"
        label.textAlignment = .center
    }
}
