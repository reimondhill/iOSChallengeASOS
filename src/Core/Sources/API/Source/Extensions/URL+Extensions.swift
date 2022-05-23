//
// Copyright © 2021 ReimondHill. All rights reserved.
//

import Foundation

public extension URL {
	/// Appends a list of parameters.
	/// - Parameter params: The parameters to be appended.
	/// - Returns: New URL with the given params, or nil if the URL doesn't support it.
	/// - Remark: The URL must conform to RFC 3986.
    func appending(params: [URLQueryItem]) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            // URL is not conforming to RFC 3986 (maybe it is only conforming to RFC 1808, RFC 1738, and RFC 2732)
            return nil
        }
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + params
        return urlComponents.url
    }
}
