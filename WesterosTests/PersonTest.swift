//
//  CharacterTest.swift
//  Westeros
//
//  Created by Francesc Callau Brull on 6/7/17.
//  Copyright © 2017 fcallau. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    var starkHouse: House!
    var starkSigil: Sigil!
    var ned: Person!
    var me: Person!
    
    var groupPersons: Set<Person>!
    var arrayPersons: Array<Person>!
    
    override func setUp() {
        super.setUp()
        
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", nameIcon: "iconCodeIsComing.png")
        
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        me = Person(name: "Franc", alias: "fcallau", house: starkHouse)
        
        groupPersons = Set.init()
        arrayPersons = Array.init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPersonExistence() {
        XCTAssertNotNil(ned)
    }
    
    func testFullName() {
        XCTAssertNotNil(ned.fullName)
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testEqualPersons() {
        XCTAssertEqual(ned, ned)
        
        XCTAssertNotEqual(ned, me)
    }
    
    func testComparePersons() {
        XCTAssertLessThan(ned, me)
        
        XCTAssertGreaterThan(me, ned)
    }
    
    func testAddPersonToSet() {
        XCTAssertEqual(groupPersons.count, 0)
        groupPersons.insert(ned)
        
        XCTAssertEqual(groupPersons.count, 1)
        groupPersons.insert(me)
        
        XCTAssertEqual(groupPersons.count, 2)
        groupPersons.insert(ned)
        
        XCTAssertEqual(groupPersons.count, 2)
    }
    
    func testAddPersonToArray() {
        XCTAssertEqual(arrayPersons.count, 0)
        arrayPersons.append(ned)
        
        XCTAssertEqual(arrayPersons.count, 1)
        arrayPersons.append(me)
        
        XCTAssertEqual(arrayPersons.count, 2)
        arrayPersons.append(ned)
        
        XCTAssertEqual(arrayPersons.count, 3)
    }
    
}
