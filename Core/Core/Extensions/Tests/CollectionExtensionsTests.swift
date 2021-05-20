//
//  CollectionExtensionsTests.swift
//  CoreTests
//
//  Created by Ramon Haro Marques on
//

import XCTest
@testable import Core

class CollectionTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - Test functions
    func test_GivenCollection_ThenAssertSafeIndex() {
        let testArray = ["One", "Two", "Three"]
        
        XCTAssertEqual(testArray[safe: 0], "One")
        XCTAssertEqual(testArray[safe: 3], nil)
    }
    
    func test_GivenCollection_ThenAssertUniqueValues() {
        let testStrings = ["1", "1", "2", "3", "4", "4"]
        XCTAssertEqual(testStrings.unique, ["1", "2", "3", "4"])
        
        let testInts = [1, 1, 2, 3, 4, 4]
        XCTAssertEqual(testInts.unique, [1, 2, 3, 4])
    }
}
