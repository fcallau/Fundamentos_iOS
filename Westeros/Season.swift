//
//  Season.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 15/8/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import Foundation

// MARK: - Classes
typealias Episodes = Set<Episode>

// MARK: - Season
final class Season {
    private var _episodes: Episodes
    let name: String
    private var _airDate: Date?
    
    var airDate: Date {
        get {
            return _airDate ?? Date()
        }
    }
    
    init(name: String, airDate: Date?) {
        (self.name, _airDate) = (name, airDate)        
        _episodes = Episodes()
    }
    
    convenience init(name: String) {
        self.init(name: name, airDate: nil)
    }
}

// MARK: - extension Season
extension Season {
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard episode.season == self else {
            return
        }
        
        _episodes.insert(episode)
        
        // Calcular airDate de Season = airDate del primer episodio de la temporada
        _airDate = _episodes.sorted()[0].airDate
    }
    
    // Variadic version (ejemplo de uso: stark.add(persons: robb, arya))
    func add(episodes: Episode...){
        for episode in episodes{
            add(episode: episode)
        }
    }
    
    func getEpisode(titled: String) -> Episode? {
        return (_episodes.filter { $0.title == titled }).first
    }
    
    func sortedEpisodes() -> [Episode] {
        return _episodes.sorted()
    }
}

extension Season {
    var proxy: String {
        return "\(airDate.description) \(name)"
    }
}

extension Season: CustomStringConvertible {
    var description: String {
        return "\(name) \(airDate.description)"
    }
}

extension Season: Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
