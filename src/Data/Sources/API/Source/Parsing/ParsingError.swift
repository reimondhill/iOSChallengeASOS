//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation

public enum ParsingError {
	public enum Encoding: Error {
		case methodNotSupported
		case jsonTypeNotSupported
		case noEncodingSet
	}

	public enum Decoding: Error {
		case noMIMETypeAvailable
		case typeNotSupported
	}
}
