//
//  ViewController.swift
//  ExampleProject
//
//  Created by Amit Majumdar on 25/11/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import UIKit
import UtilityFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print([1, 2, 4].reduceAny())
        print([1.3, 2.5, 4.0].reduceAny())
        print(["Hello", "World"].concat())
    }
}
