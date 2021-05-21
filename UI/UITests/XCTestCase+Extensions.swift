//
//  XCTestCase+Extensions.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest

public extension XCTestCase {
    func expect(description: String = "", timeOut: Double = 10, completion: @escaping (XCTestExpectation)->Void) {
        let expectationItem = expectation(description: description)
        completion(expectationItem)
        
        wait(for: [expectationItem], timeout: timeOut)
    }
}
