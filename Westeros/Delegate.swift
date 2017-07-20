//
//  Delegate.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 18/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit

final class Delegates {
    static func housesDelegate(model: [House]) -> ArrayTableViewDelegate<House> {
        return ArrayTableViewDelegate(model: model, controllerCreator: { (posElement: Int) -> (UIViewController) in
            return HouseViewController(model: model[posElement])
        })
    }
    
    static func personsDelegate(model: [Person]) -> ArrayTableViewDelegate<Person> {
        return ArrayTableViewDelegate(model: model, controllerCreator: nil)
    }
}
