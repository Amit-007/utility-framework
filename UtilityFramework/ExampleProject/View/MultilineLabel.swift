//
//  MultilineLabel.swift
//  UtilityFramework
//
//  Created by Majumdar, Amit (US - Bengaluru) on 04/12/18.
//  Copyright © 2018 Majumdar, Amit (US - Bengaluru). All rights reserved.
//

import UIKit

public class MultilineLabel: UILabel {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setDefaultProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(frame: .mainBounds)
        setDefaultProperties()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setDefaultProperties()
    }
}


extension MultilineLabel {
   
    private func setDefaultProperties() {
        numberOfLines = 0
        textColor = .black
        adjustsFontForContentSizeCategory = true
    }
}
