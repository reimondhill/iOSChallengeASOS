//
//  ReusableViewTests.swift
//  UITests
//
//  Created by Ramon Haro Marques on 21/05/2021.
//

import XCTest
@testable import UI

class ReusableViewTests: XCTestCase {
    //MARK: - Properties
    var testView = TestView()
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    //MARK: - Test functions
    func test_GivenView_ThenAssertReusableView() {
        XCTAssertEqual(TestView.reuseIdentifier, "TestView")
    }
}
