//
//  BaseLoaderIndicatorTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import UI

class BaseLoaderIndicatorTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }
    
    
    //MARK: - Test functions
    func test_GivenBaseBaseLoaderIndicatorTests_ThenAssertCorrectSetup() {
        let configuration = BaseLoaderIndicator.Configuration.default
        let baseLoaderIndicator = BaseLoaderIndicator(configuration: configuration)
        
        XCTAssertEqual(baseLoaderIndicator.style, configuration.style)
        XCTAssertEqual(baseLoaderIndicator.color, configuration.color)
        XCTAssertEqual(baseLoaderIndicator.hidesWhenStopped, configuration.hidesWhenStopped)
    }
}
