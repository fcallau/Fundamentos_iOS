//
//  Character.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 6/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import Foundation

final class Person {
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        get {
            return _alias ?? ""
        }
    }
    
    // init(name: String, alias: String? = nil, house: House) {
    init(name: String, alias: String?, house: House) {
        self.name = name
        _alias = alias
        self.house = house
    }
    
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house)
    }
}

extension Person {
    var proxy: String {
        return "\(name) \(alias) \(house.name)"
    }
}

extension Person {
    var fullName: String {
        get {
            return "\(name) \(house.name)"
        }
    }
}

extension Person: Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person: Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.hashValue < rhs.hashValue
    }
}
