//
//  CompanyInfoTableViewCellTests.swift
//  UITests
//
//  Created by Ramon Haro Marques on 21/05/2021.
//

import XCTest
@testable import UI

class CompanyInfoTableViewCellTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }

    //MARK: - Test functions
    func test_CompanyInfoTableViewCell_AssertContent() {
        let configuration = BaseTableViewCell.Configuration.default
        let text = "SPACEX"
        
        let cell = CompanyInfoTableViewCell(frame: .zero)
        cell.setup(companyInfo: text)
        
        XCTAssertEqual(cell.titleLabel.text, text)
        XCTAssertEqual(cell.backgroundColor, configuration.backgroundColor)
        XCTAssertEqual(cell.selectedBackgroundView?.backgroundColor, configuration.selectedBackgroundColor)
    }
}
