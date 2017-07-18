//
//  HousesViewController.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 18/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit

class HousesViewController<T>: UITableViewController {
    let model: [T]
    
    init(model: [T]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // ¿Sería necesario crear un cellID para cada uno de los posibles <T>?
        // ¿Sería necesario crear un cellID para cada uno de los posibles <T>?
        // ¿Sería necesario crear un cellID para cada uno de los posibles <T>?
        // ¿Sería necesario crear un cellID para cada uno de los posibles <T>?
        // ¿Sería necesario crear un cellID para cada uno de los posibles <T>?
        var cellID: String
        
        if (T.self == House.self) {
            cellID = "HouseCell"
        } else {
            cellID = "PersonCell"
        }
        
        let element = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // La creo a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar element -> Cell
        if (T.self == House.self) {
            cell?.imageView?.image = (element as! House).sigil.image
            cell?.textLabel?.text = (element as! House).name
        } else {
            cell?.textLabel?.text = (element as! Person).name
        }
        
        return cell!
    }
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (T.self == House.self) {
            let houseVC = HouseViewController(model: model[indexPath.row] as! House)
            
            navigationController?.pushViewController(houseVC, animated: true)
        }
    }
}
