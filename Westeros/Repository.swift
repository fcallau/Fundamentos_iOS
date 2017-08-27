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
    var seasons: [Season] { get }
    
    func house(named: String) -> House?
    func houses(filteredBy: (House) -> Bool) -> [House]
    
    func season(named: String) -> Season?
    func seasons(filteredBy: (Season) -> Bool) -> [Season]
}

final class LocalFactory : HouseFactory {
    var houses: [House] {
        get {
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.jpg"), description: "Three headed dragon")
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            let stark = House(name: "Stark",
                              sigil: starkSigil,
                              words: "Winter is coming!",
                              url: starkURL)
            let lannister = House(name: "Lannister",
                                  sigil: lannisterSigil,
                                  words: "Hear me roar!",
                                  url: lannisterURL)
            let targaryen = House(name: "Targaryen",
                                  sigil: targaryenSigil,
                                  words: "Fire & Blood",
                                  url: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            let jaime = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            
            let daenerys  = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
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
        return houses.first { $0.name.uppercased() == named.uppercased() }
    }
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        return Repository.local.houses.filter(filteredBy)
        // return (Repository.local.houses.filter { filteredBy($0) })
    }
    
    var seasons: [Season] {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            
            let firstSeason = Season(name: "Season 1")
            let secondSeason = Season(name: "Season 2")
            let thirdSeason = Season(name: "Season 3")
            let fourthSeason = Season(name: "Season 4")
            let fifthSeason = Season(name: "Season 5")
            let sixthSeason = Season(name: "Season 6")
            
            let episode101 = Episode(title: "Winter Is Comming", airDate: dateFormatter.date(from: "May 9, 2011")!, season: firstSeason)
            let episode102 = Episode(title: "The Kingsroad", airDate: dateFormatter.date(from: "May 16, 2011")!, season: firstSeason)
            let episode103 = Episode(title: "Lord Snow", airDate: dateFormatter.date(from: "May 23, 2011")!, season: firstSeason)
            let episode201 = Episode(title: "The North Remebers", airDate: dateFormatter.date(from: "Apr 1, 2012")!, season: secondSeason)
            let episode202 = Episode(title: "The Night Lands", airDate: dateFormatter.date(from: "Apr 8, 2012")!, season: secondSeason)
            let episode301 = Episode(title: "Valar Dohaeris", airDate: dateFormatter.date(from: "Mar 31, 2013")!, season: thirdSeason)
            let episode302 = Episode(title: "Dark Wings, Dark Words", airDate: dateFormatter.date(from: "Apr 7, 2013")!, season: thirdSeason)
            let episode401 = Episode(title: "Two Swords", airDate: dateFormatter.date(from: "Apr 6, 2014")!, season: fourthSeason)
            let episode402 = Episode(title: "The Lion and the Rose", airDate: dateFormatter.date(from: "Apr 13, 2014")!, season: fourthSeason)
            let episode501 = Episode(title: "The Wars to Come", airDate: dateFormatter.date(from: "Apr 12, 2015")!, season: fifthSeason)
            let episode502 = Episode(title: "The House of Black and White", airDate: dateFormatter.date(from: "Apr 19, 2015")!, season: fifthSeason)
            let episode601 = Episode(title: "The Red Woman", airDate: dateFormatter.date(from: "Apr 24, 2016")!, season: sixthSeason)
            let episode602 = Episode(title: "Home", airDate: dateFormatter.date(from: "May 1, 2016")!, season: sixthSeason)
            
            firstSeason.add(episode: episode101)
            firstSeason.add(episode: episode102)
            firstSeason.add(episode: episode103)
            secondSeason.add(episode: episode201)
            secondSeason.add(episode: episode202)
            thirdSeason.add(episode: episode301)
            thirdSeason.add(episode: episode302)
            fourthSeason.add(episode: episode401)
            fourthSeason.add(episode: episode402)
            fifthSeason.add(episode: episode501)
            fifthSeason.add(episode: episode502)
            sixthSeason.add(episode: episode601)
            sixthSeason.add(episode: episode602)
            
            return [firstSeason, secondSeason, thirdSeason, fourthSeason, fifthSeason, sixthSeason].sorted()
        }
    }
    
    func season(named: String) -> Season? {
        return seasons.first { $0.name.uppercased() == named.uppercased()}
    }
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        return Repository.local.seasons.filter(filteredBy)
    }
}
