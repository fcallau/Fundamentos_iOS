//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 18/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element>: NSObject, UITableViewDataSource {
    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model: Elements
    private let _cellMaker: CellMaker
    
    init(model: Elements, cellMaker: @escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elt = _model[indexPath.row]
        
        return _cellMaker(elt, tableView)
    }
}
