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
}

final class LocalFactory : HouseFactory {
    var houses: [House] {
        get {
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            
            let robb = Person(name: "Robb", alias: "The ypung wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            // Añadir los personajes a las casas
            stark.add(person: robb)
            stark.add(person: arya)
            
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            
            return [stark, lannister].sorted()
        }
    }
    
    func house(named: String) -> House? {
        return houses.first { $0.name == named }
    }
}
