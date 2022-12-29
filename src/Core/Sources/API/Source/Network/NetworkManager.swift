//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

public protocol NetworkManager {
	/// Executes a network request with given parameters.
	/// - Parameters:
	///   - baseURL: The base URL for the request.
	///   - apiEndpoint: The endpoint containing the API configuration to be used on the request.
	///   - completion: Callback triggered once the action completes.
	func executeRequest<T: APIEndpoint>(
		baseURL: URL,
		apiEndpoint: T,
		completion: ((Result<T.Response, Error>)->Void)?
	)

	/// Executes a network request with given parameters.
	/// - Parameters:
	///   - baseURL: The base URL for the request.
	///   - apiEndpoint: The endpoint containing the API configuration to be used on the request.
	/// - Returns: The response declared on the endpoint configuration.
	/// - Throws: If a failable step avoids returning the response object.
	func executeRequest<T: APIEndpoint>(
		baseURL: URL,
		apiEndpoint: T
	) async throws -> T.Response
}
