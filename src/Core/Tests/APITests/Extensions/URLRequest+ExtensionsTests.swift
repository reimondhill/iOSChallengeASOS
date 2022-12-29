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

	func test_URL_WhenInitializing_ThenCorrectURL() throws {
		let urlRequest = try URLRequest(
			url: url,
			apiEndpoint: APIEndpointMock()
		)
		XCTAssertEqual(urlRequest.url, url)
	}

	func test_GivenAPIEndpoint_WhenInitializing_ThenHTTPMethodIsAdded() throws {
		try HTTPMethod.allCases.forEach { httpMethod in
			let apiEndPoint = APIEndpointMock()
			apiEndPoint.stubbedMethod = httpMethod
			let urlRequest = try URLRequest(
				url: url,
				apiEndpoint: apiEndPoint
			)
			XCTAssertEqual(urlRequest.httpMethod, httpMethod.rawValue)
		}
	}

	func test_GivenAPIEndpoint_WhenInitializing_ThenEndpointsAreAdded() throws {
		let testValues: [URLComponents?] = [
			nil,
			URLComponents(string: "component1"),
		]

		try testValues.forEach { testValue in
			let apiEndPoint = APIEndpointMock()
			apiEndPoint.stubbedEndpoint = testValue
			let urlRequest = try URLRequest(
				url: url,
				apiEndpoint: apiEndPoint
			)

			let expectedOutput = "\(url.absoluteString)\(testValue == nil ? "" : "/\(testValue!.path)")"
			XCTAssertEqual(urlRequest.url?.absoluteString, expectedOutput)
		}
	}

	func test_GivenAPIEndpoint_WhenInitializing_ThenHeadersAreAdded() throws {
		let testValues: [Set<HTTPHeader>?] = [
			nil,
			[
				HTTPHeader(key: "key1", value: "value1"),
				HTTPHeader(key: "key2", value: "value2"),
			],
		]

		try testValues.forEach { testValue in
			let apiEndPoint = APIEndpointMock()
			apiEndPoint.stubbedHeaders = testValue
			let urlRequest = try URLRequest(
				url: url,
				apiEndpoint: apiEndPoint
			)

			let allHTTPHeaderFields = try XCTUnwrap(urlRequest.allHTTPHeaderFields)
			XCTAssertEqual(allHTTPHeaderFields, testValue?.asDictionary ?? [:])
		}
	}

	func test_GivenAPIEndpoint_WhenInitializing_ThenQueryItemsAreAdded() throws {
		let testValues: [Set<URLQueryItem>?] = [
			nil,
			[
				URLQueryItem(name: "name1", value: "value1"),
				URLQueryItem(name: "name2", value: "value2"),
			],
		]

		try testValues.forEach { testValue in
			let apiEndPoint = APIEndpointMock()
			apiEndPoint.stubbedQueryItems = testValue
			let urlRequest = try URLRequest(
				url: url,
				apiEndpoint: apiEndPoint
			)

			let url = try XCTUnwrap(urlRequest.url)
			let urlComponents = try XCTUnwrap(URLComponents(string: url.absoluteString))
			let queryItems = urlComponents.queryItems
			if let testValue {
				XCTAssertEqual(urlComponents.queryItems, Array(testValue))
			} else {
				XCTAssertNil(queryItems)
			}
		}
	}
}
