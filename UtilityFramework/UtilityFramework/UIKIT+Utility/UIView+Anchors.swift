//
//  UIView+Anchors.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit

extension UIView {
    public func addConstraintsWithFormat(_ format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    public func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
    public func fillSuperviewWithSafeArea() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }
    }
    
    public func anchor(_ top: NSLayoutYAxisAnchor? = nil,
                       leading: NSLayoutXAxisAnchor? = nil,
                       bottom: NSLayoutYAxisAnchor? = nil,
                       trailing: NSLayoutXAxisAnchor? = nil,
                       topConstant: CGFloat = 0,
                       leadingConstant: CGFloat = 0,
                       bottomConstant: CGFloat = 0,
                       trailingConstant: CGFloat = 0,
                       widthConstant: CGFloat = 0,
                       heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top,
                                    leading: leading,
                                    bottom: bottom,
                                    trailing: trailing,
                                    topConstant: topConstant,
                                    leadingConstant: leadingConstant,
                                    bottomConstant: bottomConstant,
                                    trailingConstant: trailingConstant,
                                    widthConstant: widthConstant,
                                    heightConstant: heightConstant)
    }
    
    public func anchorWithReturnAnchors(_ top: NSLayoutYAxisAnchor? = nil,
                                        leading: NSLayoutXAxisAnchor? = nil,
                                        bottom: NSLayoutYAxisAnchor? = nil,
                                        trailing: NSLayoutXAxisAnchor? = nil,
                                        topConstant: CGFloat = 0,
                                        leadingConstant: CGFloat = 0,
                                        bottomConstant: CGFloat = 0,
                                        trailingConstant: CGFloat = 0,
                                        widthConstant: CGFloat = 0,
                                        heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: leadingConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        return anchors
    }
    
    public func anchorCenterXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
}
