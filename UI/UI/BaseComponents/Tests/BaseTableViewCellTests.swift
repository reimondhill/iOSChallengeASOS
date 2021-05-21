//
//  BaseTableViewCellTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import UI

class BaseTableViewCellTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }
    
    
    //MARK: - Test functions
    func test_GivenBaseTableViewCell_ThenAssertCorrectSetup() {
        let configuration = BaseTableViewCell.Configuration.default
        let baseTableViewCell = BaseTableViewCell(style: .default, reuseIdentifier: "Reuse")
        
        XCTAssertEqual(baseTableViewCell.backgroundColor, configuration.backgroundColor)
        XCTAssertEqual(baseTableViewCell.selectedBackgroundView?.backgroundColor, configuration.selectedBackgroundColor)
    }
}
