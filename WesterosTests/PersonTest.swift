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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        starkHouse = House(name: "stark", sigil: starkSigil, words: "Winter is coming!")
        
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence() {
        
        
        XCTAssertNotNil(ned)
    }
    
    func testFullName() {
        XCTAssertNotNil(ned.fullName, "Eddard Stark")
    }
    
}
