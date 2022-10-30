//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import API
import Foundation

final public class APIEndpointMock: APIEndpoint {
	// MARK: - Constructor

	public init() {}

	// MARK: - APIEndpoint
	
	public var stubbedMethod: HTTPMethod = .get
	public private(set) var didCallMethod = false
	public var method: HTTPMethod {
		didCallMethod = true
		return stubbedMethod
	}

	public var stubbedEndpoint: URLComponents?
	public private(set) var didCallEndpoint = false
	public var endpoint: URLComponents? {
		didCallEndpoint = true
		return stubbedEndpoint
	}

	public var stubbedHeaders: [HTTPHeader]?
	public private(set) var didCallHeaders = false
	public var headers: [HTTPHeader]? {
		didCallHeaders = true
		return stubbedHeaders
	}

	public var stubbedQueryItems: [URLQueryItem]?
	public private(set) var didCallQueryItems = false
	public var queryItems: [URLQueryItem]? {
		didCallQueryItems = true
		return stubbedQueryItems
	}
}