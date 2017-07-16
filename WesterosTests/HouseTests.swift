//
//  HouseTests.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 6/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    var starkHouse: House!
    var lannisterHouse: House!
    
    var groupHouses: Set<House>!
    var arrayHouses: Array<House>!
    
    override func setUp() {
        super.setUp()
        
        starkHouse = Repository.local.house(named: "Stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
        
        groupHouses = Set.init()
        arrayHouses = Array.init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouseExistence() {
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
    }
    
    func testSigilExistence() {
        XCTAssertNotNil(starkHouse.sigil)
        XCTAssertNotNil(lannisterHouse.sigil)
    }
    
    func testGetPersonNamed() {
        XCTAssertNotNil(starkHouse.getPerson(named: "Robb"))
    }
    
    func testAddPerson() {
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person: starkHouse.getPerson(named: "Robb")!)
        
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    func testEqualHouses() {
        XCTAssertEqual(starkHouse, starkHouse)
        
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testCompareHouses() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
        
        XCTAssertGreaterThan(starkHouse, lannisterHouse)
    }
    
    func testAddHouseToSet() {
        XCTAssertEqual(groupHouses.count, 0)
        groupHouses.insert(starkHouse)
        
        XCTAssertEqual(groupHouses.count, 1)
        groupHouses.insert(lannisterHouse)
        
        XCTAssertEqual(groupHouses.count, 2)
        groupHouses.insert(starkHouse)
        
        XCTAssertEqual(groupHouses.count, 2)
    }
    
    func testAddHouseToArray() {
        XCTAssertEqual(arrayHouses.count, 0)
        arrayHouses.append(starkHouse)
        
        XCTAssertEqual(arrayHouses.count, 1)
        arrayHouses.append(lannisterHouse)
        
        XCTAssertEqual(arrayHouses.count, 2)
        arrayHouses.append(starkHouse)
        
        XCTAssertEqual(arrayHouses.count, 3)
    }
}
