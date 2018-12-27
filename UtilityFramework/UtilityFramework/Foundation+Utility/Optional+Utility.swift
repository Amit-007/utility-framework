//
//  Optional+Utility.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import Foundation

// MARK:- Converting nil into errors

extension Optional {
    
    public func orThrow(_ errorExpression: @autoclosure() -> Error) throws -> Wrapped {
        guard let value = self else {
            throw errorExpression()
        }
        return value
    }
}

// MARK:- Expressive checks

extension Optional where Wrapped: Collection {
    
    public var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

// MARK:- Matching against a predicate

extension Optional {
    
    public func matching(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let value = self else {
            return nil
        }
        guard predicate(value) else {
            return nil
        }
        return value
    }
}

// MARK:- Assigning reusable views

// let statusView = cell.acessoryView.get(orSet: TodoItemStatusView())
// statusView.status = item.status

extension Optional where Wrapped == UIView {
    
    public mutating func get<T: UIView>(orSet expression: @autoclosure () -> T) -> T {
        guard let view = self as? T else {
            let newView = expression()
            self = newView
            return newView
        }
        return view
    }
}
