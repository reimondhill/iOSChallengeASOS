//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

// MARK: - Constructors

extension URLRequest {
	public init(
		url: URL,
		apiEndpoint: some APIEndpoint
	) throws {
		self.init(url: url)
		httpMethod = apiEndpoint.method.rawValue.capitalized

		if let endpoint = apiEndpoint.endpoint {
			if #available(iOS 16.0, *) {
				self.url = self.url?.appending(path: endpoint.path)
			} else {
				self.url = self.url?.appendingPathComponent(endpoint.path)
			}
		}

		if let headers = apiEndpoint.headers {
			headers.forEach { (header) in
				addValue(header.value, forHTTPHeaderField: header.key)
			}
		}

		if let queryItems = apiEndpoint.queryItems {
			if #available(iOS 16.0, *) {
				self.url = self.url?.appending(queryItems: Array(queryItems))
			} else {
				self.url = self.url?.appending(params: Array(queryItems))
			}
		}

		self.httpBody = try apiEndpoint.requestData()
	}
}
