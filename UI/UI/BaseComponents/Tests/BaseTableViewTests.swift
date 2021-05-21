//
//  BaseTableViewTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import UI

class BaseTableViewTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }
    
    
    //MARK: - Test functions
    func test_GivenBaseTableView_ThenAssertCorrectSetup() {
        let configuration = BaseTableView.Configuration.default
        let baseTableView = BaseTableView(configuration: configuration)
        
        XCTAssertEqual(baseTableView.backgroundColor, configuration.backgroundColor)
    }
}
