//
//  CharacterTest.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 6/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    var starkHouse: House!
    
    var robb: Person!
    var arya: Person!
    
    var groupPersons: Set<Person>!
    var arrayPersons: Array<Person>!
    
    override func setUp() {
        super.setUp()
        
        starkHouse = Repository.local.house(named: "Stark")
        
        robb = starkHouse.getPerson(named: "Robb")
        arya = starkHouse.getPerson(named: "Arya")
        
        groupPersons = Set.init()
        arrayPersons = Array.init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPersonExistence() {
        XCTAssertNotNil(robb)
        XCTAssertNotNil(arya)
    }
    
    func testFullName() {
        XCTAssertNotNil(robb.fullName)
        XCTAssertEqual(robb.fullName, "Robb Stark")
    }
    
    func testEqualPersons() {
        XCTAssertEqual(robb, robb)
        
        XCTAssertNotEqual(robb, arya)
    }
    
    func testComparePersons() {
        XCTAssertLessThan(arya, robb)
        
        XCTAssertGreaterThan(robb, arya)
    }
    
    func testAddPersonToSet() {
        XCTAssertEqual(groupPersons.count, 0)
        groupPersons.insert(robb)
        
        XCTAssertEqual(groupPersons.count, 1)
        groupPersons.insert(arya)
        
        XCTAssertEqual(groupPersons.count, 2)
        groupPersons.insert(robb)
        
        XCTAssertEqual(groupPersons.count, 2)
    }
    
    func testAddPersonToArray() {
        XCTAssertEqual(arrayPersons.count, 0)
        arrayPersons.append(robb)
        
        XCTAssertEqual(arrayPersons.count, 1)
        arrayPersons.append(arya)
        
        XCTAssertEqual(arrayPersons.count, 2)
        arrayPersons.append(robb)
        
        XCTAssertEqual(arrayPersons.count, 3)
    }
}
