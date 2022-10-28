//
// Copyright © 2021 ReimondHill. All rights reserved.
//

import Foundation

public extension URLRequest {
	convenience init(
		url: URL,
		endPoint: APIEndpoint
	) {
		self.init(url: url)

		self.httpMethod = endPoint.method.rawValue.capitalized

		// Appending headers
		self.appending(headers: endPoint.headers)

		// Appending Query parameters
		self.appending(
			params: endPoint.queryItems,
			httpMethod: endPoint.method
		)

		// Appending endpoint
		self.url?.pathComponents.append(endPoint.endpoint.path)

		// Appending
	}
    /// Appends a list of HTTP headers to URLRequest.
    /// - Parameter headers: The HTTP headers to append.
    /// - Returns: The URLRequest with the given HTTP headers.
    func appending(headers: [HTTPHeader]) -> URLRequest {
        var urlRequest = self
        
        headers.forEach { (header) in
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return urlRequest
    }
    
    /// Appends a list of parameters for a GET URL Request.
    /// - Parameters:
    ///   - params: The params to be added.
	///   - httpMethod: The HTTP method used.
    /// - Returns: The URLRequest with the GET params appended to the URL.
    func appending(
		params: [URLQueryItem],
		httpMethod: HTTPMethod
	) -> URLRequest {
        var urlRequest = self

		switch httpMethod {
		case .get:
			urlRequest.url = urlRequest.url?.appending(params: params)
		case .post:
			urlRequest.httpBody = Data(params.utf8)
		}
        
        return urlRequest
    }
}
