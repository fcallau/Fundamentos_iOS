//
//  SeasonTests.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 15/8/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    var firstSeason: Season!
    var secondSeason: Season!
    
    var groupSeasons: Set<Season>!
    var arraySeasons: Array<Season>!
    
    override func setUp() {
        super.setUp()
        
        firstSeason = Repository.local.season(named: "Season 1")
        secondSeason = Repository.local.season(named: "Season 2")
        
        groupSeasons = Set.init()
        arraySeasons = Array.init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(firstSeason)
    }
    
    func testGetEpisodeNamed() {
        XCTAssertNotNil(firstSeason.getEpisode(titled: "Winter Is Comming"))
        XCTAssertNil(secondSeason.getEpisode(titled: "Winter Is Comming"))
    }
    
    func testAddEpisode() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        
        XCTAssertEqual(firstSeason.count, 3)
        firstSeason.add(episode: Episode(title: "Cripples, Bastards, and Broken Things", airDate: dateFormatter.date(from: "May 30, 2011")!, season: firstSeason))
        
        XCTAssertEqual(firstSeason.count, 4)
    }
    
    func testEqualSeasons() {
        XCTAssertEqual(firstSeason, firstSeason)
        
        XCTAssertNotEqual(firstSeason, secondSeason)
    }
    
    func testCompareSeasons() {
        XCTAssertLessThan(firstSeason, secondSeason)
        
        XCTAssertGreaterThan(secondSeason, firstSeason)
    }
    
    func testAddSeasonToSet() {
        XCTAssertEqual(groupSeasons.count, 0)
        groupSeasons.insert(firstSeason)
        
        XCTAssertEqual(groupSeasons.count, 1)
        groupSeasons.insert(secondSeason)
        
        XCTAssertEqual(groupSeasons.count, 2)
        groupSeasons.insert(firstSeason)
        
        XCTAssertEqual(groupSeasons.count, 2)
    }
    
    func testAddSeasonToArray() {
        XCTAssertEqual(arraySeasons.count, 0)
        arraySeasons.append(firstSeason)
        
        XCTAssertEqual(arraySeasons.count, 1)
        arraySeasons.append(secondSeason)
        
        XCTAssertEqual(arraySeasons.count, 2)
        arraySeasons.append(firstSeason)
        
        XCTAssertEqual(arraySeasons.count, 3)
    }
}
