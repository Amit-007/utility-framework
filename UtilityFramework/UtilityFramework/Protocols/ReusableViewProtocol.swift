//
//  ReusableViewProtocol.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import Foundation

public protocol ReusableView {
    static var defaultReuseIdentifier: String { get }
}
public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
