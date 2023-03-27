//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import TestingUtilities
import XCTest

@testable import API

final class JSONCoderTests: XCTestCase {
	// MARK: - Properties

	private struct Person: Decodable {
		let name: String
		let surname: String
	}

	// MARK: - Tests

	func test_GivenDataAndType_WhenDecodingADecodable_ThenAssertCorrectValue() throws {
		let testCases: [TestCase<(name: String?, surname: String?), Bool>] = [
			TestCase(
				input: (nil, nil),
				output: false
			),
			TestCase(
				input: (nil, "Burton"),
				output: false
			),
			TestCase(
				input: ("Alex", nil),
				output: false
			),
			TestCase(
				input: ("Alex", "Burton"),
				output: true
			),
		]
		try testCases.assertEqualTestCases { input in
			let jsonString = makePersonJSONString(
				name: input.name,
				surmane: input.surname
			)
			let jsonData = try XCTUnwrap(jsonString.data(using: .utf8))
			let person = try? JSONCoder.decode(from: jsonData, type: Person.self)
			return person != nil
		}
	}
}

// MARK: - Helpers

extension JSONCoderTests {
	private func makePersonJSONString(name: String?, surmane: String?) -> String {
		let jsonString =
   """
   {
       "name": \(makeJSONValue(for: name)),
       "surname": \(makeJSONValue(for: surmane))
   }
   """
		return jsonString
	}

	private func makeJSONValue(for value: String?) -> String {
		guard let value else {
			return "NULL"
		}
		return "\"\(value)\""
	}
}
