//
//  URL+Extensions.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension URL {
    /// Appends parameters to the URL
    /// - Parameters:
    ///   - params: Items to be appended
    /// - Returns: New URL by adding the query items, or nil if the URL doesn't support it.
    /// - Remark: The URL must conform to RFC 3986.
    func appending(params: [String:String]) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            // URL is not conforming to RFC 3986 (maybe it is only conforming to RFC 1808, RFC 1738, and RFC 2732)
            return nil
        }

        urlComponents.queryItems = (urlComponents.queryItems ?? []) + params.compactMap({ URLQueryItem(name: $0.key, value: $0.value) })

        return urlComponents.url
    }
}
