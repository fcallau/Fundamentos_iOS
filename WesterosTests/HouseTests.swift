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
    var starkImage: UIImage!
    var lannisterImage: UIImage!
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    var groupHouses: Set<House>!
    var arrayHouses: Array<House>!
    
    override func setUp() {
        super.setUp()
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        groupHouses = Set.init()
        arrayHouses = Array.init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouseExistence() {
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPerson() {
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
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
