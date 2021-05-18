//
//  BaseDataTest.swift
//  DataTests
//
//  Created by Ramon Haro Marques on 18/05/2021.
//

import XCTest

class BaseDataTest: XCTestCase {
    //MARK: - Properties
    var baseURL: URL = URL(string: "http://some.where")!
    var networkFetcher: MockNetworkManager = MockNetworkManager()
    
    //MARK: - Helpers
    func expect(description: String = "", timeOut: Double = 10, completion: (XCTestExpectation)->Void) {
        let expectation = expectation(description: description)
        completion(expectation)
        
        waitForExpectations(timeout: timeOut)
    }
}
