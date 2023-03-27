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

	public var stubbedHeaders: Set<HTTPHeader>?
	public private(set) var didCallHeaders = false
	public var headers: Set<HTTPHeader>? {
		didCallHeaders = true
		return stubbedHeaders
	}

	public var stubbedQueryItems: Set<URLQueryItem>?
	public private(set) var didCallQueryItems = false
	public var queryItems: Set<URLQueryItem>? {
		didCallQueryItems = true
		return stubbedQueryItems
	}

	public var body: ()
}
