//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import APITestUtilities
import XCTest

@testable import API

final class URLRequest_ExtensionsTests: XCTestCase {
	// MARK: - Properties

	private let url = URL(string: "https://aurl.it.is")!

	// MARK: - Tests

	// MARK: Constructor

	func test_GivenAPIEndpoint_WhenInitializing_ThenHTTPMethodIsAdded() {
		HTTPMethod.allCases.forEach { httpMethod in
			let apiEndPoint = APIEndpointMock()
			apiEndPoint.stubbedMethod = httpMethod
			let urlRequest = URLRequest(
				url: url,
				apiEndpoint: apiEndPoint
			)
			XCTAssertEqual(urlRequest.httpMethod, httpMethod.rawValue)
		}
	}

	func test_GivenAPIEndpoint_WhenInitializing_ThenEndpointsAreAdded() {
		let testValues: [URLComponents?] = [
			nil,
			URLComponents(string: "component1"),
		]

		testValues.forEach { testValue in
			let apiEndPoint = APIEndpointMock()
			apiEndPoint.stubbedEndpoint = testValue
			let urlRequest = URLRequest(
				url: url,
				apiEndpoint: apiEndPoint
			)

			let expectedOutput = "\(url.absoluteString)\(testValue == nil ? "" : "/\(testValue!.path)")"
			XCTAssertEqual(urlRequest.url?.absoluteString, expectedOutput)
		}
	}

	func test_GivenAPIEndpoint_WhenInitializing_ThenHeadersAreAdded() throws {
		let testValues: [[HTTPHeader]?] = [
			nil,
			[
				(key: "key1", value: "value1"),
				(key: "key2", value: "value2"),
			],
		]

		try testValues.forEach { testValue in
			let apiEndPoint = APIEndpointMock()
			apiEndPoint.stubbedHeaders = testValue
			let urlRequest = URLRequest(
				url: url,
				apiEndpoint: apiEndPoint
			)

			let allHTTPHeaderFields = try XCTUnwrap(urlRequest.allHTTPHeaderFields)
			XCTAssertEqual(allHTTPHeaderFields, testValue?.asDictionary ?? [:])
		}
	}
}
