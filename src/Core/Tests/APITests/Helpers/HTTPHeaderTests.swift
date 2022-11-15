//
// Copyright © 2022 ReimondHill. All rights reserved.
//
	

import XCTest

@testable import API

final class HTTPHeaderTests: XCTestCase {
	func testCorrectDictionaryValue_WhenContainedInArray() {
		let array: [HTTPHeader] = [
			HTTPHeader(key: "Key1", value: "Value1"),
			HTTPHeader(key: "Key1", value: "AnotherValue1"),
			HTTPHeader(key: "Key2", value: "Value2"),
		]
		let expectedDictionary: [String : String] = [
			"Key1" : "AnotherValue1",
			"Key2" : "Value2"
		]
		XCTAssertEqual(array.asDictionary, expectedDictionary)
	}
}
