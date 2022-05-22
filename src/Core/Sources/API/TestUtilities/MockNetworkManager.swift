//
// Copyright © 2021 ReimondHill. All rights reserved.
//

import Foundation
import Core

public class MockNetworkManager {
    //MARK: - Class model
    typealias T = (Codable, Decodable)
    
    enum MockNetworkManagerError: Error {
        case invalid
    }
    
    private struct RequestResponsePair: Codable {
        let request: String?
        let response: String?
    }
    
    
    //MARK: - Properties
    let isUITesting: Bool
    
    public var injectedCodable: Codable?
    public var injectedData: Data?
    
    public var spyURL: URL?
    public var spyHTTPMethod: HTTPMethod?
    public var spyHeaders: [String:String]?
    public var spyParams: [String:Any]?
    
    
    //MARK: - Constructor
    public init(isUITesting: Bool = false) {
        self.isUITesting = isUITesting
    }
}


private extension MockNetworkManager {
    func getUITestInjectedResponse(url: URL) -> Data? {
        guard isUITesting else {
            return nil
        }
        
        let path = url.pathComponents.joined(separator: "/").replacingOccurrences(of: "//", with: "/")
        if let base64EncodedString = ProcessInfo.processInfo.environment[path],
           let pairData = Data(base64Encoded: base64EncodedString),
           let requestResponsePair = try? JSONDecoder().decode(RequestResponsePair.self, from: pairData),
           let responseBase64EncodedString = requestResponsePair.response {
            return Data(base64Encoded: responseBase64EncodedString)
        }
        
        return nil
    }
}


//MARK: - NetworkFetcher implementation
extension MockNetworkManager: NetworkFetcher {
    public func fetchCodable<T:Codable>(url: URL, HTTPMethod: HTTPMethod, headers: [String:String], params: [String:Any], completion: @escaping (Result<T,Error>) -> Void) {
        spyURL = url
        spyHTTPMethod = HTTPMethod
        spyHeaders = headers
        spyParams = params
        
        if let injectedCodable = injectedCodable as? T{
            completion(.success(injectedCodable))
        } else if let dataResponse = getUITestInjectedResponse(url: url) {
            print(try! JSONDecoder().decode(T.self, from: dataResponse))
            completion(.success(try! JSONDecoder().decode(T.self, from: dataResponse)))
        } else {
            completion(.failure(MockNetworkManagerError.invalid))
        }
    }
    
    public func fetchData(url: URL, HTTPMethod: HTTPMethod, headers: [String : String], params: [String : Any], completion: @escaping (Result<Data, Error>) -> Void) {
        _ = getUITestInjectedResponse(url: url)
        
        if let injectedData = injectedData {
            completion(.success(injectedData))
        } else {
            completion(.failure(MockNetworkManagerError.invalid))
        }
    }
}
