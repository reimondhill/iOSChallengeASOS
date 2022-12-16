//
// Copyright © 2022 ReimondHill. All rights reserved.
//
	

import Foundation

/// A namespace for used HTTP header fields.
public typealias HTTPHeaderFieldKey = String

extension HTTPHeaderFieldKey {
	public static let authorization: HTTPHeaderFieldKey = "Authorization"
	public static let contentType: HTTPHeaderFieldKey = "Content-Type"
	public static let siteOrigin: HTTPHeaderFieldKey = "x-site-origin"
}
