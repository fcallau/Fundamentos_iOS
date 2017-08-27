//
//  EpisodeTests.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 21/8/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    var firstSeason: Season!
    
    var firstEpisode: Episode!
    var secondEpisode: Episode!
    
    var groupEpisodes: Set<Episode>!
    var arrayEpisodes: Array<Episode>!
    
    override func setUp() {
        super.setUp()
        
        firstSeason = Repository.local.season(named: "Season 1")
        
        firstEpisode = firstSeason.getEpisode(titled: "Winter Is Comming")
        secondEpisode = firstSeason.getEpisode(titled: "The Kingsroad")
        
        groupEpisodes = Set.init()
        arrayEpisodes = Array.init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeExistence() {
        XCTAssertNotNil(firstEpisode)
        XCTAssertNotNil(secondEpisode)
    }
    
    func testEpisodeTitle() {
        XCTAssertNotNil(firstEpisode.title)
        XCTAssertEqual(firstEpisode.title, "Winter Is Comming")
    }
    
    func testEpisodeAirDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        
        XCTAssertNotNil(firstEpisode.airDate)
        XCTAssertEqual(firstEpisode.airDate, dateFormatter.date(from: "May 9, 2011")!)
    }
    
    func testSeasonEpisode() {
        XCTAssertNotNil(firstEpisode.season)
        XCTAssertEqual(firstEpisode.season, firstSeason)
    }
    
    func testEqualEpisodes() {
        XCTAssertEqual(firstEpisode, firstEpisode)
        
        XCTAssertNotEqual(firstEpisode, secondEpisode)
    }
    
    func testCompareEpisodes() {
        XCTAssertLessThan(firstEpisode, secondEpisode)
        
        XCTAssertGreaterThan(secondEpisode, firstEpisode)
    }
    
    func testAddEpisodeToSet() {
        XCTAssertEqual(groupEpisodes.count, 0)
        groupEpisodes.insert(firstEpisode)
        
        XCTAssertEqual(groupEpisodes.count, 1)
        groupEpisodes.insert(secondEpisode)
        
        XCTAssertEqual(groupEpisodes.count, 2)
        groupEpisodes.insert(firstEpisode)
        
        XCTAssertEqual(groupEpisodes.count, 2)
    }
    
    func testAddEpisodeToArray() {
        XCTAssertEqual(arrayEpisodes.count, 0)
        arrayEpisodes.append(firstEpisode)
        
        XCTAssertEqual(arrayEpisodes.count, 1)
        arrayEpisodes.append(secondEpisode)
        
        XCTAssertEqual(arrayEpisodes.count, 2)
        arrayEpisodes.append(firstEpisode)
        
        XCTAssertEqual(arrayEpisodes.count, 3)
    }
}
