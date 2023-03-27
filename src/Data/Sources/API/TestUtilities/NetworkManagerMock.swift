//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation
import API

public final class NetworkManagerMock {
	//MARK: - Properties

	//MARK: - Helpers

	public func reset() {
	}

	//MARK: - NetworkManagerInterface

	public func executeRequest<Endpoint: APIEndpoint>(
		baseURL: URL,
		endpoint: Endpoint
	) async throws -> Endpoint.Response {
		fatalError()
	}
}
