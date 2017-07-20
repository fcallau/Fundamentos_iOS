//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 18/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {
    let dataSource: ArrayDataSource<Element>
    let delegate: ArrayTableViewDelegate<Element>
    
    init(dataSource: ArrayDataSource<Element>, delegate: ArrayTableViewDelegate<Element>, title: String, style: UITableViewStyle) {
        self.dataSource = dataSource
        self.delegate = delegate
        
        super.init(style: style)
        
        self.title = title
        
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        
        delegate.delegateOf(controller: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
