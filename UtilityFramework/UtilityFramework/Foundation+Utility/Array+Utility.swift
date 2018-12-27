//
//  Array+Utility.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import Foundation

extension Array where Element: Numeric {
    
    /// A generic method that can perform reduce any data type i.e, Int, CGFloat, float etc
    ///
    /// - Returns: a reduced value
    public func reduceAny() -> Element {
        return reduce(0, +)
    }
}


extension Array where Element == String {
    
    /// This returns a concatenated string from the elements present in the Array itself
    ///
    /// - Returns: A concatenated string
    public func concat() -> String {
        return reduce("", {$0 + $1 + " "})
    }
}
