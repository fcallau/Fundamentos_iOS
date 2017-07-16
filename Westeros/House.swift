//
//  House.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 6/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import UIKit


// MARK: - Classes
typealias Words = String
typealias Members = Set<Person>


// MARK: - House
final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words) {
        (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
    }
}

// MARK: - Sigil
final class Sigil {
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String) {
        (self.image, self.description) = (image, description)
    }
}

// MARK: - extension House
extension House {
    var count: Int {
        return _members.count
    }
    
    func add(person: Person) {
        guard person.house == self else {
            return
        }
        
        _members.insert(person)
    }
    
    func getPerson(named: String) -> Person? {
        return (_members.filter { $0.name == named ? true : false }).first
    }
}

extension House {
    var proxyForEquality: String {
        get {
            return "\(name) \(words) \(count)"
        }
    }
    
    var proxyForComparison: String {
        get {
            return name.uppercased()
        }
    }
}

extension House: Hashable {
    var hashValue: Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}


extension House: Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
