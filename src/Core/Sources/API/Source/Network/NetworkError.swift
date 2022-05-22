//
// Copyright © 2022 ReimondHill. All rights reserved.
//  

import Foundation
import Localization

/// A list of recognised errors.
public enum NetworkError: LocalizedError {
	/// Error returned when there is a developer issue mostly
	case invalid

	/// Error returned when the parameters are invalid
	case invalidParams

	/// Error returned when the URL is not valid
	case invalidURL

	/// Error returned when the data is unavailable
	case dataCorrupted

	/// Error returned when there is a network problem
	case networkError

	/// Error returned when ther is an unknown network problem
	case unknown

	//MARK: LocalizedError implementation
	var errorDescription: String? {
		switch self {
		case .invalid:
			return "Developer Error"
		case .invalidParams:
			return Localization.NetworkErrors.networkErrorInvalidParams
		case .invalidURL:
			return Localization.NetworkErrors.networkErrorInvalidURL
		case .dataCorrupted:
			return Localization.NetworkErrors.networkErrorDataCorrupted
		case .networkError:
			return Localization.NetworkErrors.networkError
		case .unknown:
			return Localization.NetworkErrors.errorUnknown
		}
	}
}
