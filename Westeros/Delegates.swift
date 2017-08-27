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
    
    static func membersDelegate(model: [Person]) -> ArrayTableViewDelegate<Person> {
        return ArrayTableViewDelegate(model: model, controllerCreator: nil)
    }
    
    static func seasonsDelegate(model: [Season]) -> ArrayTableViewDelegate<Season> {
        return ArrayTableViewDelegate(model: model, controllerCreator: { (posElement: Int) -> (UIViewController) in
            return SeasonViewController(model: model[posElement])
        })
    }
    
    static func episodesDelegate(model: [Episode]) -> ArrayTableViewDelegate<Episode> {
        return ArrayTableViewDelegate(model: model, controllerCreator: { (posElement: Int) -> (ArrayTableViewController<Person>) in
            var members: [Person] = []
            
            for house in Repository.local.houses {
                members.append(contentsOf: house.sortedMembers())
            }
            
            members.sort()
            
            let dataSource = DataSources.membersDataSource(model: members)
            let delegate = Delegates.membersDelegate(model: members)
            let membersVC = ArrayTableViewController(dataSource: dataSource,
                                                     delegate: delegate,
                                                     title: "Characters",
                                                     style: .plain)
            
            return membersVC
        })
    }
}
