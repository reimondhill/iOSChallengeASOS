//
//  CompanyInfoFetcher.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public class CompanyInfoFetcher {
    //MARK: - Properties
    let networkFetcher: NetworkFetcher
    let baseURL: URL
    
    
    //MARK: - Constructor
    init(networkFetcher: NetworkFetcher, baseURL: URL) {
        self.networkFetcher = networkFetcher
        self.baseURL = baseURL
    }
}


//MARK: - CompanyInfoFetcherInterface
extension CompanyInfoFetcher: CompanyInfoFetcherInterface {
    func getInfo(completion: @escaping (Result<CompanyInfo, Error>) -> Void) {
        let url = baseURL
            .appendingPathComponent("v3")
            .appendingPathComponent("info")
        
        let headers:[String:String] = [:]
        let params:[String:Any] = [:]
        
        networkFetcher.fetchCodable(url: url,
                                    httpMethodType: .get,
                                    headers: headers,
                                    params: params,
                                    completion: completion)
    }
}
