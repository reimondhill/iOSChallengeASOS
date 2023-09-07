//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import Foundation
import Utilities

@objc public final class NativeNetworkManager: NSObject {
	//MARK: - Properties

	public enum Error: Swift.Error {
		case invalidData
		case networkError
		case unknown
	}

	private lazy var urlSession: URLSession = {
		let sessionConfig = URLSessionConfiguration.default

		sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData

		return URLSession(
			configuration: sessionConfig,
			delegate: self,
			delegateQueue: nil
		)
	}()
}


//MARK: - Helpers

extension NativeNetworkManager {
	private func decodeResponse<Endpoint: APIEndpoint>(
		data: Data?,
		urlResponse: URLResponse?,
		apiEndPoint: Endpoint
	) throws -> Endpoint.Response {
		guard
			let urlResponse,
			let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode,
			(200...300).contains(statusCode)
		else {
			throw Error.networkError
		}

		guard let data else {
			throw Error.invalidData
		}

		return try apiEndPoint.decodeResponse(
			data: data,
			urlResponse: urlResponse
		)
	}
}

//MARK: - NetworkManager

extension NativeNetworkManager: NetworkManager {
	public func executeRequest<T: APIEndpoint>(
		baseURL: URL,
		apiEndpoint: T,
		completion: ((Result<T.Response, Swift.Error>) -> Void)?
	) {
		do {
			let urlRequest = try URLRequest(
				url: baseURL,
				apiEndpoint: apiEndpoint
			)
			urlSession.dataTask(with: urlRequest) { [weak self] (data, response, error) in
				guard let self else {
					return
				}

				if let error {
					completion?(.failure(error))
				}
				else {
					do {
						let decodedResponse = try self.decodeResponse(
							data: data,
							urlResponse: response,
							apiEndPoint: apiEndpoint
						)
						completion?(.success(decodedResponse))
					} catch {
						completion?(.failure(error))
					}
				}
			}
		} catch {
			completion?(.failure(error))
		}
	}

	public func executeRequest<T: APIEndpoint>(
		baseURL: URL,
		apiEndpoint: T
	) async throws -> T.Response {
		let urlRequest = try URLRequest(
			url: baseURL,
			apiEndpoint: apiEndpoint
		)
		let (data, response) = try await urlSession.data(for: urlRequest)
		return try decodeResponse(
			data: data,
			urlResponse: response,
			apiEndPoint: apiEndpoint
		)
	}
}


//MARK: - URLSessionTaskDelegate

extension NativeNetworkManager: URLSessionTaskDelegate {}
