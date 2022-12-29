//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

/// Provides functionalities to decode from JSON objects.
public protocol JSONDecodable {
	/// Decodes JSON Data to a particular object.
	/// - Parameters:
	///   - jsonData: The data encoding a JSON value.
	///   - type: The type in which the data will be decoded.
	/// - Throws: If the object can't be decoded.
	func decode<T>(josnData: Data, type: T.Type) throws -> T
}
