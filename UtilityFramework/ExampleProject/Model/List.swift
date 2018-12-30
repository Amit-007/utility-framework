//
//  List.swift
//  ExampleProject
//
//  Created by Amit Majumdar on 30/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import Foundation

struct List {
    var title: String
    var subtitle: String
}


extension List {
    static var dataSource: [List] {
        return [
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation"),
        List(title: "String", subtitle: "An extension that consists of useful methods & variables to handle string manipulation")]
    }
}
