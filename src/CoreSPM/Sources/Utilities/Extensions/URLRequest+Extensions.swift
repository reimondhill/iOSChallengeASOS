//
//  URLRequest+Extensions.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension URLRequest {
    /// Appends a list of headers to URLRequest
    /// - Parameters:
    ///   - headers: The list of headers
    /// - Returns: The URLRequest with the list of headers
    func appending(headers: [String : String]) -> URLRequest {
        var urlRequest = self
        
        headers.forEach { (header) in
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return urlRequest
    }
    
    /// Appends a list of parameters for a GET URL Request
    /// - Parameters:
    ///   - getParams: The params to be added
    /// - Returns: The URLRequest with the GET params appended to the URL
    func appending(getParams: [String : String]) -> URLRequest {
        var urlRequest = self

        urlRequest.url = urlRequest.url?.appending(params: getParams)
        
        return urlRequest
    }
}
