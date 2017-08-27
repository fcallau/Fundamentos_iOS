//
//  DataSources.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 18/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit

final class DataSources {
    static func housesDataSource(model: [House]) -> ArrayDataSource<House> {
        return ArrayDataSource(model: model, cellMaker: { (house: House, tableView: UITableView) -> UITableViewCell in
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            
            return cell!
        })
    }
    
    static func membersDataSource(model: [Person]) -> ArrayDataSource<Person> {
        return ArrayDataSource(model: model, cellMaker: { (house: Person, tableView: UITableView) -> UITableViewCell in
            let cellID = "Person"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = house.fullName
            
            return cell!
        })
    }
    
    static func seasonsDataSource(model: [Season]) -> ArrayDataSource<Season> {
        return ArrayDataSource(model: model, cellMaker: { (season: Season, tableView: UITableView) -> UITableViewCell in
            let cellID = "Season"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = season.name
            cell?.detailTextLabel?.text = "\(season.count) episodes"
            
            return cell!
        })
    }
    
    static func episodesDataSource(model: [Episode]) -> ArrayDataSource<Episode> {
        return ArrayDataSource(model: model, cellMaker: { (episode: Episode, tableView: UITableView) -> UITableViewCell in
            let cellID = "Episode"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = episode.title
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            
            cell?.detailTextLabel?.text = dateFormatter.string(from: episode.airDate)
            
            return cell!
        })
    }
}
