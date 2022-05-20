//
//  RocketFetcher.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public class RocketFetcher: BaseFetcher {
    enum Endpoints: String, CaseIterable {
        case allRockets = "rockets"
    }
}


//MARK: - RocketFetcherInterface implementation
extension RocketFetcher: RocketFetcherInterface {
    public func fetchRockets(completion: @escaping (Result<[Rocket], Error>) -> Void) {
        let url = baseURL
            .appendingPathComponent(Self.apiVersion)
            .appendingPathComponent(Endpoints.allRockets.rawValue)
        
        let headers:[String:String] = [:]
        let params:[String:Any] = [:]
        
        networkFetcher.fetchCodable(url: url,
                                    httpMethodType: .get,
                                    headers: headers,
                                    params: params,
                                    completion: completion)
    }
    
    public func getRocket(id: String, completion: @escaping (Result<Rocket, Error>) -> Void) {
        let url = baseURL
            .appendingPathComponent(Self.apiVersion)
            .appendingPathComponent(Endpoints.allRockets.rawValue)
            .appendingPathComponent(id)
        
        let headers:[String:String] = [:]
        let params:[String:Any] = [:]
        
        networkFetcher.fetchCodable(url: url,
                                    httpMethodType: .get,
                                    headers: headers,
                                    params: params,
                                    completion: completion)
        
    }

}
