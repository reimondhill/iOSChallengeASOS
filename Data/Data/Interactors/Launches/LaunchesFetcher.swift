//
//  LaunchesFetcher.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public class LaunchesFetcher: BaseFetcher {
    enum Endpoints: String, CaseIterable {
        case allLaunches = "launches"
    }
}


//MARK: - LaunchesFetcherInterface implementation
extension LaunchesFetcher: LaunchesFetcherInterface {
    public func getLaunch(completion: @escaping (Result<[Launch], Error>) -> Void) {
        let url = baseURL
            .appendingPathComponent(Self.apiVersion)
            .appendingPathComponent(Endpoints.allLaunches.rawValue)
        
        let headers:[String:String] = [:]
        let params:[String:Any] = [:]
        
        networkFetcher.fetchCodable(url: url,
                                    httpMethodType: .get,
                                    headers: headers,
                                    params: params,
                                    completion: completion)
    }
}
