//
// Copyright © 2022 ReimondHill. All rights reserved.
//  

import Foundation

public struct HTTPHeader: Hashable, Equatable {
	public let key: String
	public let value: String
}

extension Collection where Element == HTTPHeader {
	public var asDictionary: [String : String] {
		return reduce(into: [:]) { partialResult, element in
			partialResult[element.key] = element.value
		}
	}
}

