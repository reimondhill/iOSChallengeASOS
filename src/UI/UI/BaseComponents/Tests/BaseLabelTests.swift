//
//  BaseLabelTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import UI

class BaseLabelTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }
    
    
    //MARK: - Test functions
    func test_GivenBaseLabel_ThenAssertCorrectSetup() {
        BaseLabel.Style.allCases.forEach { style in
            let label = BaseLabel(style: style)
            switch style {
            case .title:
                XCTAssertEqual(label.font, UIFont.title)
                XCTAssertEqual(label.textColor, UIColor.primaryText)
                XCTAssertEqual(label.highlightedTextColor, UIColor.secondaryText)
            case .body:
                XCTAssertEqual(label.font, UIFont.body)
                XCTAssertEqual(label.textColor, UIColor.primaryText)
                XCTAssertEqual(label.highlightedTextColor, UIColor.secondaryText)
            case .bodyBold:
                XCTAssertEqual(label.font, UIFont.bodyBold)
                XCTAssertEqual(label.textColor, UIColor.primaryText)
                XCTAssertEqual(label.highlightedTextColor, UIColor.secondaryText)
            case .bodySecondary:
                XCTAssertEqual(label.font, UIFont.body)
                XCTAssertEqual(label.textColor, UIColor.secondaryText)
                XCTAssertEqual(label.highlightedTextColor, UIColor.secondaryText)
            }
        }
    }
}
