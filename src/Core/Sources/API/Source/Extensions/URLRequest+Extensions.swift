//
// Copyright © 2021 ReimondHill. All rights reserved.
//

import Foundation

// MARK: - Constructors

extension URLRequest {
	public init(
		url: URL,
		apiEndpoint: some APIEndpoint
	) {
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
			append(headers: headers)
		}

		if let queryItems = apiEndpoint.queryItems {
			append(
				queryItems: queryItems,
				httpMethod: apiEndpoint.method
			)
		}
	}
}

// MARK: - helpers

extension URLRequest {
	mutating public func append(headers: [HTTPHeader]) {
		headers.forEach { (header) in
			addValue(header.value, forHTTPHeaderField: header.key)
		}
	}

	mutating public func append(
		queryItems: [URLQueryItem],
		httpMethod: HTTPMethod
	) {
		switch httpMethod {
		case .get:
			if #available(iOS 16.0, *) {
				url = url?.appending(queryItems: queryItems)
			} else {
				url = url?.appending(params: queryItems)
			}
		case .post:
			httpBody = Data(queryItems.description.utf8)
		}
	}
}
