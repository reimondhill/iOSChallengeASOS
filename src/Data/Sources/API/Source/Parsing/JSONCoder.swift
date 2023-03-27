//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

enum JSONCoder {
	static func decode<T: Decodable>(from data: Data, type: T.Type) throws -> T {
		let decoder = JSONDecoder()
		return try decoder.decode(type.self, from: data)
	}
}
