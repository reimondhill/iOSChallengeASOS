//
//  NativeNetworkManager.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

fileprivate extension HTTPMethodType {
    func toURLRequestHTTPMethodType() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

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
    func generateURLRequest(url: URL, httpMethodType: HTTPMethodType, headers: [String : String] , params: [String : Any]) throws -> URLRequest {
        // Create object
        var urlRequest = URLRequest(url: url)
        
        // Setting httpMethodType
        urlRequest.httpMethod = httpMethodType.toURLRequestHTTPMethodType()

        //Setting headers
        urlRequest = urlRequest.appending(headers: headers)
        
        //Setting params
        switch httpMethodType {
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
    
//    func generateError(from data: Data, preferredError: Error? = nil) -> Error {
//        if let error1 = try? JSONDecoder().decode(APIError1.self, from: data) {
//            return error1
//        } else {
//            return preferredError ?? NetworkFetcherError.unknown
//        }
//    }
    
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


//MARK: - Public methods
//MARK: NetworkFetcher implementation
extension NativeNetworkManager: NetworkFetcher {
    public func fetchCodable<T:Codable>(url: URL, httpMethodType: HTTPMethodType, headers: [String:String], params: [String:Any], completion: @escaping (Result<T,Error>) -> Void) {
        let urlRequest: URLRequest
        do {
            urlRequest = try generateURLRequest(url: url, httpMethodType: httpMethodType, headers: headers, params: params)
        } catch {
            completion(.failure(error))
            return
        }

        performRequest(urlRequest) { (result) in
            switch result{
            case .success(let data):
                do {
                    completion(.success(try JSONDecoder().decode(T.self, from: data)))
                } catch let decodableError {
                    completion(.failure(decodableError))
                    //completion(.failure(self.generateError(from: data, preferredError: decodableError)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func fetchData(url: URL, httpMethodType: HTTPMethodType, headers: [String:String], params: [String:Any], completion: @escaping (Result<Data,Error>) -> Void) {
        let urlRequest: URLRequest
        do {
            urlRequest = try generateURLRequest(url: url, httpMethodType: httpMethodType, headers: headers, params: params)
        } catch {
            completion(.failure(error))
            return
        }

        performRequest(urlRequest, completion: completion)
    }
}


//MARK: - URLSessionTaskDelegate implementation
extension NativeNetworkManager: URLSessionTaskDelegate {}
