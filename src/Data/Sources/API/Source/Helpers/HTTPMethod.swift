//
// Copyright © 2022 ReimondHill. All rights reserved.
//  

import Foundation

/// Type of network request
public enum HTTPMethod: String, CaseIterable {
	case connect = "CONNECT"
	case delete = "DELETE"
	case get = "GET"
	case head = "HEAD"
	case options = "OPTIONS"
	case trace = "TRACE"
	case post = "POST"
	case put = "PUT"
}
