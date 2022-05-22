//
// Copyright © 2021 ReimondHill. All rights reserved.
//

import Foundation
import Utilities

@objc public class NativeNetworkManager: NSObject {
    //MARK: - Properties

    private lazy var urlSession: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        
        sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        return URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
    }()
}


//MARK: - Private methods

private extension NativeNetworkManager {
    func generateURLRequest(url: URL, HTTPMethod: HTTPMethod, headers: [String : String] , params: [String : Any]) throws -> URLRequest {
        // Create object
        var urlRequest = URLRequest(url: url)
        
        // Setting HTTPMethod
        urlRequest.httpMethod = HTTPMethod.toURLRequestHTTPMethod()

        //Setting headers
        urlRequest = urlRequest.appending(headers: headers)
        
        //Setting params
        switch HTTPMethod {
        case .get:
            guard let params = params as? [String:String] else {
                throw NetworkError.invalidParams
            }
            urlRequest = urlRequest.appending(getParams: params)
        case .post:
            break
        }
        
        return urlRequest
    }

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
