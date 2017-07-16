//
//  Repository.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 14/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import Foundation

final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House] { get }
    
    func house(named: String) -> House?
    func houses(filteredBy: (House) -> Bool) -> [House]
}

final class LocalFactory : HouseFactory {
    var houses: [House] {
        get {
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.jpg"), description: "Fire and Blood")
            
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Some words")
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            let jaime = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let daenerys  = Person(name: "Daenerys", alias: "Dragonmother", house: targaryen)
            let viserys  = Person(name: "Viserys", alias: "The Beggar King", house: targaryen)
            
            // Añadir los personajes a las casas
            stark.add(person: robb)
            stark.add(person: arya)
            
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            lannister.add(person: jaime)
            
            targaryen.add(person: daenerys)
            targaryen.add(person: viserys)
            
            return [stark, lannister, targaryen].sorted()
        }
    }
    
    func house(named: String) -> House? {
        return houses.first { $0.name == named }
    }
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        return (houses.filter { filteredBy($0) })
    }
}
