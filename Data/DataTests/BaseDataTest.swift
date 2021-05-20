//
//  BaseDataTest.swift
//  DataTests
//
//  Created by Ramon Haro Marques
//

import XCTest

class BaseDataTest: XCTestCase {
    //MARK: - Properties
    var baseURL: URL = URL(string: "http://some.where")!
    var networkFetcher: MockNetworkManager = MockNetworkManager()
    
    //MARK: - Helpers
    func expect(description: String = "", timeOut: Double = 10, completion: @escaping (XCTestExpectation)->Void) {
        let expectationItem = expectation(description: description)
        completion(expectationItem)
        
        wait(for: [expectationItem], timeout: timeOut)
    }
}
