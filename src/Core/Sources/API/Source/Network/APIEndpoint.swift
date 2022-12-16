//
// Copyright © 2022 ReimondHill. All rights reserved.
//  

import Foundation

public protocol APIEndpoint {
	/// The HTTP method used in the call
	var method: HTTPMethod { get }

	/// The path of the URL to be appended to the manager's base URL. It shouldn't include a query
	var endpoint: URLComponents? { get }

	/// Headers specific to this endpoint. These will take precedence if other headers with the same key are found when forming the request.
	var headers: Set<HTTPHeader>? { get }

	/// The items to query in the call. Defaults to no query.
	var queryItems: Set<URLQueryItem>? { get }

	/// The data that is encoded in the HTTP body. When `RequestBody` is `Void` this will default to `()`.
	var body: RequestBody { get }

	/// The type which is encoded the HTTP body. Use `Void`if the call doesn't send any data throug the Body.
	associatedtype RequestBody = Void

	/// The type which is decoded from the response's HTTP body. Use `Void` if no data needs to be decoded.
	associatedtype Response = Void

	/// The type which is decoded from the response's HTTP body when the status code is not a successful one.
	associatedtype ResponseError = Void
}

extension APIEndpoint {
	var contentType: String? {
		guard let headers else {
			return nil
		}
		return headers.first{ $0.key == HTTPHeaderFieldKey.contentType }?.value
	}
}
