//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

public typealias LocalizableString = String

public extension LocalizableString {
	func localized(bundle: Bundle) -> String {
		return NSLocalizedString(
			self,
			bundle: bundle,
			comment: ""
		)
	}
}
