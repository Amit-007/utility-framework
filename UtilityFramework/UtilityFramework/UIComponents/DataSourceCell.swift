//
//  DataSourceCell.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 30/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit

open class DataSourceCell: UICollectionViewCell {
    
    open var datasourceItem: Any?
    open weak var controller: DataSourceController?
    
    open var seperator: UIView = {
        let seperator = UIView()
        seperator.backgroundColor = UIColor(white: 0, alpha: 0.5)
        seperator.isHidden = true
        return seperator
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    ///Override this method to provide your own custom views.
    open func setupViews() {
        clipsToBounds = true
        addSubview(seperator)
        seperator.anchor(leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor,
                         heightConstant: 0.5)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DataSourceCell: ReusableView {
    
}
