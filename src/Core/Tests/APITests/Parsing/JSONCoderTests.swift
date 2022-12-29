//
// Copyright © 2022 ReimondHill. All rights reserved.
//

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
		let jsonString = makePersonJSONString(name: "Alex", surmane: "Burton")
		let jsonData = try XCTUnwrap(jsonString.data(using: .utf8))
		let person = try JSONCoder.decode(from: jsonData, type: Person.self)
		print(person)
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
