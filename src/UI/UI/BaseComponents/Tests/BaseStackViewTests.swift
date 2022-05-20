//
//  BaseStackViewTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import UI

class BaseStackViewTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }
    
    
    //MARK: - Test functions
    func test_GivenBaseStackView_ThenAssertCorrectSetup() {
        let configuration = BaseStackView.Configuration.default
        let baseStackView = BaseStackView(configuration: configuration)
        
        XCTAssertEqual(baseStackView.spacing, configuration.spacing)
    }
}
