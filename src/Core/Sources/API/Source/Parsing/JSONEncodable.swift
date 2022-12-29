//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

public protocol JSONEncodable {
	/// Data encoding a JSON value
	var jsonData: Data? { get }
}

// MARK: - Helpers

extension JSONEncodable {
	/// Returns the JSON String generated from **jsonData**. It's useful for logging purposes.
	public var jsonString: String? {
		guard let jsonData else {
			return nil
		}
		return String(
			data: jsonData,
			encoding: .utf8
		)
	}
}

// MARK: - JSONEncodable + Dictionary

extension Dictionary: JSONEncodable {
	public var jsonData: Data? {
		guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
			return nil
		}
		return data
	}
}
