//
//  NetworkFetcher.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation

/// Type of network request
public enum HTTPMethodType: String{
    /// GET HTTP method
    case get = "GET"
    /// POST HTTP method
    case post = "POST"
}

/// A list of recognised errors
enum NetworkError: LocalizedError {
    /// Error returned when there is a developer issue mostly
    case invalid
    
    /// Error returned when the parameters are invalid
    case invalidParams
    
    /// Error returned when the URL is not valid
    case invalidURL
    
    /// Error returned when the data is unavailable
    case dataCorrupted
    
    /// Error returned when there is a network problem
    case networkError
    
    /// Error returned when ther is an unknown network problem
    case unknown
    
    
    //MARK: LocalizedError implementation
    var errorDescription: String? {
        switch self {
        case .invalid:
            return "Developer Error"
        case .invalidParams:
            return LocalisedStrings.networkErrorInvalidParams
        case .invalidURL:
            return LocalisedStrings.networkErrorInvalidURL
        case .dataCorrupted:
            return LocalisedStrings.networkErrorDataCorrupted
        case .networkError:
            return LocalisedStrings.networkError
        case .unknown:
            return LocalisedStrings.errorUnknown
        }
    }
}

public protocol NetworkFetcher {
    /// Fetches a Codable
    /// - Parameters:
    ///   - url: URL for the request
    ///   - httpMethodType: HTTP method to be used: GET, POST ...
    ///   - headers: Headers to be included with the request
    ///   - params: Parameters to be included with the request
    ///   - completion: Result type handler called when the request has finished
    func fetchCodable<T:Codable>(url: URL, httpMethodType: HTTPMethodType, headers: [String:String], params: [String:Any], completion: @escaping (Result<T,Error>) -> Void)
    
    /// Fetches a data
    /// - Parameters:
    ///   - url: URL for the request
    ///   - httpMethodType: HTTP method to be used: GET, POST ...
    ///   - headers: Headers to be included with the request
    ///   - params: Parameters to be included with the request
    ///   - completion: Result type handler called when the request has finished
    func fetchData(url: URL, httpMethodType: HTTPMethodType, headers: [String:String], params: [String:Any], completion: @escaping (Result<Data,Error>) -> Void)
}
