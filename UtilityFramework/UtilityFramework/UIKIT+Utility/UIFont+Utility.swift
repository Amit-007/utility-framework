//
//  UIFont+Utility.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit

extension UIFont {
    
    /// Prints all the available Font Family
    public static func printAvailableFonts() {
        let families = UIFont.familyNames
        families.sorted().forEach {
            print("\($0)")
            let names = UIFont.fontNames(forFamilyName: $0)
            print(names)
        }
    }
}
