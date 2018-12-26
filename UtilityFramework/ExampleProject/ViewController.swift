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
        let date = Date.current
        print(date.day)
        print(date.month)
        print(date.year)
        print(date.yearForWeekOfYear)
        print(date.weekOfYear)
        print(date.weekOfMonth)
        print(date.weekdayOrdinal)
        print(date.weekday)
        print(date.nanosecond)
        print(date.timeZone)
        print(date.second)
        print(date.hour)
        print(date.minute)
        print(date.quarter)
        print(date.weekdaySymbol)
        print(date.shortWeekdaySymbol)
        print(date.monthSymbol)
        print(date.shortMonthSymbol)
        print(date.standaloneWeekdaySymbol)
        print(Date.getCustomDate(day: 1, month: 1, year: 1990).endOfDay)
    }
}



extension ViewController {
    
}
