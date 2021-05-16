//
//  URLExtensionsTests.swift
//  CoreTests
//
//  Created by Ramon Haro Marques
//

import XCTest
import Core

class URLExtensionsTests: XCTestCase {
    //MARK: - Properties
    let params = ["id":"1", "name":"foo"]
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    //MARK: - Test functions
    func test_GivenValidRFCURLAndParams_WhenAppended_ThenAssertURLContainsParams() {
        let baseURL = Constants.rfc3986BaseURL
        let url = Constants.rfc3986BaseURL.appending(params: params)
        
        XCTAssertTrue((url?.absoluteString == "\(baseURL)?id=1&name=foo") || (url?.absoluteString == "\(baseURL)?name=foo&id=1"))
    }
    
    func test_GivenNotValidRFCURLAndParams_WhenAppended_ThenAssertURLContainsParams() {
        let url = Constants.rfc3986NotBaseURL.appending(params: params)
        XCTAssertNil(url)
    }
}
