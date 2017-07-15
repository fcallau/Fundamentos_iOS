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
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        XCTAssertEqual(houses.count, 2)
    }
    
    func testOrderedHousesArray() {
        let houses = Repository.local.houses
        var index = 0
        
        while index < houses.count - 1 {
            XCTAssertLessThan(houses[index], houses[index + 1])
            
            index += 1
        }
    }
    
    func testGetHouse() {
        XCTAssertNotNil(Repository.local.house(named: "Stark"))
        XCTAssertNil(Repository.local.house(named: "Unknown"))
    }
}