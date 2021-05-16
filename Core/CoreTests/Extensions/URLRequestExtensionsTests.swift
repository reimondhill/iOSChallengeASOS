//
//  URLRequestExtensionsTests.swift
//  CoreTests
//
//  Created by Ramon Haro Marques
//

import XCTest
import Core

class URLRequestExtensionsTests: XCTestCase {
    //MARK: - Properties
    let baseBase: URL = Constants.rfc3986BaseURL
    var urlRequest: URLRequest = URLRequest(url: Constants.rfc3986BaseURL)
    let params: [String:String] = ["name":"John"]
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    //MARK: - Test functions
    func test_GivenURLRequestAndParams_ThenAssertHeaderContainsParams() {
        let urlRequest = urlRequest.appending(headers: params)
        
        guard let allHTTPHeaderFields = urlRequest.allHTTPHeaderFields else {
            XCTFail("Headers are NIL")
            return
        }
        
        XCTAssertTrue(allHTTPHeaderFields.contains(where: { $0.key == "name" && $0.value == "John" }))
    }
    
    func test_GivenURLRequestAndParams_ThenAssertURLContainsParams() {
        let urlRequest = urlRequest.appending(getParams: params)
        
        guard let urlString = urlRequest.url?.absoluteString else {
            XCTFail("URL is NIL")
            return
        }
        
        XCTAssertEqual(urlString, "\(baseBase)?name=John")
    }
}
