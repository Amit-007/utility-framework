//
//  CGRect+Utility.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import Foundation

extension CGRect {
    
    public static var mainBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    public static var screenWidth: CGFloat {
        return mainBounds.width
    }
    
    public static var screenHeight: CGFloat {
        return mainBounds.height
    }
}
