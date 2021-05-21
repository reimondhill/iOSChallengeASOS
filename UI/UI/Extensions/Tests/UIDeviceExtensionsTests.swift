//
//  UIDeviceExtensionsTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import UI

class UIDeviceExtensionsTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }
    
    
    //MARK: - Test functions
    func test_GivenDevice_ThenAssertCorrect() {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            XCTAssertTrue(UIDevice.isPhone)
            XCTAssertFalse(UIDevice.isPad)
        case .pad:
            XCTAssertTrue(UIDevice.isPad)
            XCTAssertFalse(UIDevice.isPhone)
        default:
            break
        }
    }
}
