//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

enum BodyCoder {
	enum Error: Swift.Error {
		case cannotDecodeFromMIMEType(mimeType: String, decodedType: Any.Type)
	}

	static func decode<T>(
		from data: Data,
		mimeType: String,
		ofType type: T.Type
	) throws -> T {
		switch (mimeType, T.self) {
		case (.json, let DecodableResult as Decodable.Type):
			return try JSONCoder.decode(from: data, type: DecodableResult) as! T
		default:
			throw Error.cannotDecodeFromMIMEType(
				mimeType: mimeType,
				decodedType: type.self
			)
		}
	}
}
