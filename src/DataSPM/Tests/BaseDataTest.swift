//
//  BaseDataTest.swift
//  DataTests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import Data

class BaseDataTest: XCTestCase {
    //MARK: - Properties
    var baseURL: URL = URL(string: "http://some.where")!
    var networkFetcher: MockNetworkManager = MockNetworkManager()
}
