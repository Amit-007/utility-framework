//
//  UITableView+Utility.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register<T: UITableViewCell>(_ :T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    public func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}
