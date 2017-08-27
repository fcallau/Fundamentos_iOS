//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 14/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    var localHouses: [House]!
    var localSeasons: [Season]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 3)
    }
    
    func testOrderedHousesArray() {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testGetHouse() {
        XCTAssertNotNil(Repository.local.house(named: "StarK"))
        XCTAssertNil(Repository.local.house(named: "Unknown"))
    }
    
    func testFilteredHousesBy() {
        func moreThan2PersonsInHouse(_ house: House) -> Bool {
            return house.count > 2
        }
        
        func lessThan3PersonsInHouse(_ house: House) -> Bool {
            return house.count < 3
        }
        
        XCTAssertEqual(Repository.local.houses(filteredBy: moreThan2PersonsInHouse).count, 1)
        XCTAssertEqual(Repository.local.houses(filteredBy: lessThan3PersonsInHouse).count, 2)
    }
    
    func testLocalRepositorySeasonsCreation() {
        let seasons = Repository.local.seasons
        
        XCTAssertNotNil(seasons)
        XCTAssertEqual(seasons.count, 6)
    }
    
    func testOrderedSeasonsArray() {
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testGetSeeason() {
        XCTAssertNotNil(Repository.local.season(named: "Season 1"))
        XCTAssertNil(Repository.local.season(named: "Season 99"))
    }
    
    func testFilteredSeasonsBy() {
        func moreThan2EpisodesInSeason(_ season: Season) -> Bool {
            return season.count > 2
        }
        
        func lessThan3EpisodesInSeason(_ season: Season) -> Bool {
            return season.count < 3
        }
        
        XCTAssertEqual(Repository.local.seasons(filteredBy: moreThan2EpisodesInSeason).count, 1)
        XCTAssertEqual(Repository.local.seasons(filteredBy: lessThan3EpisodesInSeason).count, 5)
    }
}
