//
//  CompanyInfoFetcher.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public class CompanyInfoFetcher: BaseFetcher {
    enum Endpoints: String, CaseIterable {
        case info = "company"
    }
}


//MARK: - CompanyInfoFetcherInterface implementation
extension CompanyInfoFetcher: CompanyInfoFetcherInterface {
    public func getInfo(completion: @escaping (Result<CompanyInfo, Error>) -> Void) {
        let url = baseURL
            .appendingPathComponent(Self.apiVersion)
            .appendingPathComponent(Endpoints.info.rawValue)
        
        let headers:[String:String] = [:]
        let params:[String:Any] = [:]
        
        networkFetcher.fetchCodable(url: url,
                                    httpMethodType: .get,
                                    headers: headers,
                                    params: params,
                                    completion: completion)
    }
}
