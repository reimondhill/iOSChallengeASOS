//
//  RequestResponsePair.swift
//  SpaceXAppUITests
//
//  Created by Ramon Haro Marques
//

import Foundation

@testable import Core
@testable import Data

class RequestResponsePair: Codable {
    //MARK: - Properties
    var request: String? = nil
    var response: String? = nil
    
    
    //MARK: - Constructor
    init() {}
    
    init<T:Codable>(response: T) throws {
        let responseData = try JSONEncoder().encode(response)
        
        self.response = responseData.base64EncodedString()
    }
    
//    init<Request, Response>(request: Request, response: Response) throws {
//        guard let requestData = try GenericDataEncoder().encode(from: request) else {
//            throw ServiceError.parsing("couldn't parse data \(request)")
//        }
//
//        guard let responseData = try GenericDataEncoder().encode(from: response) else {
//            throw ServiceError.parsing("couldn't parse data \(response)")
//        }
//
//        self.request = requestData.base64EncodedString()
//        self.response = responseData.base64EncodedString()
//    }
}
