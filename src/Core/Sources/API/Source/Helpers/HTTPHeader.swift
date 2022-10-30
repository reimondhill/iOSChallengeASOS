//
// Copyright © 2022 ReimondHill. All rights reserved.
//  

import Foundation

public typealias HTTPHeader = (key: String, value: String)

extension HTTPHeader: Hashable {}

extension Collection where Element == HTTPHeader {
	public var asDictionary: [String : String] {
		return Dictionary(
			uniqueKeysWithValues: map{ ($0.key, $0.value) }
		)
	}
}
