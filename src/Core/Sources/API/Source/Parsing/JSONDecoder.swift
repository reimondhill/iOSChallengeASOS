//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

/// Provides JSON related information
public protocol JSONDecoder {
	/// Data encoding JSON information
	var jsonData: Data? { get }
}

extension JSONDecoder {
	var jsonString: String? {
		guard let jsonData else {
			return nil
		}
		return String(data: jsonData, encoding: .utf8)
	}
}
