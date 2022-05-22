//
// Copyright © 2021 ReimondHill. All rights reserved.
//

import Foundation

public protocol NetworkManagerInterface {
	/// Executes a network request with given parameters.
	/// - Parameters:
	///   - baseURL: The base URL for the request.
	///   - apiEndpoint: The endpoint configuration.
	/// - Returns: The response declared on the endpoint configuration.
	func executeRequest<Endpoint: APIEndpoint>(
		baseURL: URL,
		endpoint: Endpoint
	) async throws -> Endpoint.Response
}
