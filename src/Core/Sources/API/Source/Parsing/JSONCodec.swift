//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

/// A type that can be encoded to a JSON Object.
public protocol JSONEncodable {
	/// The JSON representation of this object.
	func encodeToJSON() -> JSON
}

/// A type that can be decoded from a JSON Object.
public protocol JSONDecodable {
	/// Initialise an object from the given JSON. It can throw if the JSON
	/// doesn't contain the decoder's required keys or types don't match.
	init(decodeFromJSON json: JSON) throws
}
