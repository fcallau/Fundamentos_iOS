//
//  Episode.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 15/8/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import Foundation

// MARK: - Episode
final class Episode {
    let title: String
    let airDate: Date
    weak var season: Season?
    
    init(title: String, airDate: Date, season: Season) {
        (self.title, self.airDate, self.season) = (title, airDate, season)
    }
}

// MARK: - extension Episode
extension Episode {
    var proxy: String {
        return "\(airDate.description) \(title)"
    }
}

extension Episode: CustomStringConvertible {
    var description: String {
        return "\(season!.name) \(title) \(airDate.description)"
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
