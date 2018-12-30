//
//  DataSourceController.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 30/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit

open class DataSourceController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    open var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = .white
        return activityIndicatorView
    }()
    
    open var dataSource: Datasource? {
        didSet{
            if let cellClasses = dataSource?.cellClasses() {
                for cellClass in cellClasses {
                    collectionView?.register(cellClass, forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier)
                }
            }
            
            if let headerClasses = dataSource?.headerClasses() {
                for headerClass in headerClasses {
                    collectionView?.register(headerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(headerClass))
                }
            }
            
            if let footerClasses = dataSource?.footerClasses() {
                for footerClass in footerClasses {
                    collectionView?.register(footerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(footerClass))
                }
            }
            collectionView?.reloadData()
        }
    }
    public init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.anchorCenterXToSuperview()
        activityIndicatorView.anchorCenterYToSuperview()
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        // Register cell classes
        collectionView?.register(DefaultCell.self, forCellWithReuseIdentifier: DefaultCell.defaultReuseIdentifier)
        collectionView?.register(DefaultHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DefaultHeader.defaultReuseIdentifier)
        collectionView?.register(DefaultFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: DefaultFooter.defaultReuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override open func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataSource?.numberOfSections() ?? 0
    }


    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource?.numberOfItems(section) ?? 0
    }

    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: DataSourceCell
        
        if let cellClass = dataSource?.cellClass(indexPath) {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellClass.defaultReuseIdentifier, for: indexPath) as! DataSourceCell
        } else if let cellClasses = dataSource?.cellClasses(), cellClasses.count > indexPath.section {
            let cellClass = cellClasses[indexPath.section]
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellClass.defaultReuseIdentifier, for: indexPath) as! DataSourceCell
        } else if let cellClass = dataSource?.cellClasses().first {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellClass.defaultReuseIdentifier, for: indexPath) as! DataSourceCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: DataSourceCell.defaultReuseIdentifier, for: indexPath) as! DataSourceCell
        }
        cell.controller = self
        cell.datasourceItem = dataSource?.item(indexPath)
        return cell
    }

    override open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView: DataSourceCell
        
        if kind == UICollectionView.elementKindSectionHeader {
            if let classes = dataSource?.headerClasses(), classes.count > indexPath.section {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(classes[indexPath.section]), for: indexPath) as! DataSourceCell
            } else if let cls = dataSource?.headerClasses()?.first {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! DataSourceCell
            } else {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DataSourceCell.defaultReuseIdentifier, for: indexPath) as! DataSourceCell
            }
            reusableView.datasourceItem = dataSource?.headerItem(indexPath.section)
            
        } else {
            if let classes = dataSource?.footerClasses(), classes.count > indexPath.section {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(classes[indexPath.section]), for: indexPath) as! DataSourceCell
            } else if let cls = dataSource?.footerClasses()?.first {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(cls), for: indexPath) as! DataSourceCell
            } else {
                reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DataSourceCell.defaultReuseIdentifier, for: indexPath) as! DataSourceCell
            }
            reusableView.datasourceItem = dataSource?.footerItem(indexPath.section)
        }
        reusableView.controller = self
        return reusableView
    }
    
    //need to override this otherwise size doesn't get called
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    open func getRefreshControl() -> UIRefreshControl {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return rc
    }
    
    @objc open func handleRefresh() {
        
    }

    open var layout: UICollectionViewFlowLayout? {
        get {
            return collectionViewLayout as? UICollectionViewFlowLayout
        }
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
