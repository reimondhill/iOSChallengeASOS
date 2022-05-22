//
// Copyright © 2021 ReimondHill. All rights reserved.
//

import Foundation
import Localization

extension Localization {
	enum NetworkErrors {
		/// Returns a localized message for a generic unknown error
		static var errorUnknown: LocalizableString {
			return "error_unknown".localized(bundle: Bundle.module)
		}

		/// Returns a localized message for a general network error
		static var networkError: LocalizableString {
			return "network_error".localized(bundle: Bundle.module)
		}

		/// Returns a localized message for a network error invalid params
		static var networkErrorInvalidParams: LocalizableString {
			return "network_error_invalid_params".localized(bundle: Bundle.module)
		}

		/// Returns a localized message for a network error invalid url
		static var networkErrorInvalidURL: LocalizableString {
			return "network_error_invalid_url".localized(bundle: Bundle.module)
		}

		/// Returns a localized message for a network error data corrupted: 500, 404 ...
		static var networkErrorDataCorrupted: LocalizableString {
			return "network_error_data_corrupted".localized(bundle: Bundle.module)
		}
	}
}
