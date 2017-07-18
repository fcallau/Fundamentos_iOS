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
    var localHouses : [House]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        localHouses = Repository.local.houses
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
        //        let houses = Repository.local.houses
        //        var index = 0
        //
        //        while index < houses.count - 1 {
        //            XCTAssertLessThan(houses[index], houses[index + 1])
        //
        //            index += 1
        //        }
        
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testGetHouse() {
        XCTAssertNotNil(Repository.local.house(named: "StarK"))
        XCTAssertNil(Repository.local.house(named: "Unknown"))
    }
    
    func testFilteredBy() {
        func moreThan2PersonsInHouse(_ house: House) -> Bool {
            return house.count > 2
        }
        
        func lessThan3PersonsInHouse(_ house: House) -> Bool {
            return house.count < 3
        }
        
        XCTAssertEqual(Repository.local.houses(filteredBy: moreThan2PersonsInHouse).count, 1)
        XCTAssertEqual(Repository.local.houses(filteredBy: lessThan3PersonsInHouse).count, 2)
    }
}
