//
// Copyright © 2021 ReimondHill. All rights reserved.
//

import Foundation
import Utilities

@objc public final class NativeNetworkManager: NSObject {
    //MARK: - Properties

    private lazy var urlSession: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        
        sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        return URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
    }()
}


//MARK: - Private methods

private extension NativeNetworkManager {
    func performRequest(_ urlRequest: URLRequest, completion: @escaping ((Result<Data, Error>)->Void)) {
        guard urlRequest.url != nil else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        Log.d(message: "Calling: \(urlRequest.url!.absoluteString)")
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  (200 ..< 300) ~= response.statusCode else {
                completion(.failure(NetworkError.networkError))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.dataCorrupted))
                return
            }

            completion(.success(data))
        }.resume()
    }
}

//MARK: - NetworkManagerInterface

extension NativeNetworkManager: NetworkManagerInterface {
	public func executeRequest<Endpoint>(
		baseURL: URL,
		endpoint: Endpoint
	) async throws -> Endpoint.Response where Endpoint : APIEndpoint {
		fatalError()
	}
}


//MARK: - URLSessionTaskDelegate

extension NativeNetworkManager: URLSessionTaskDelegate {}
