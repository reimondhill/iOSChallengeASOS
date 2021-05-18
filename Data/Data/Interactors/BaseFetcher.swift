//
//  BaseFetcher.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation

public class BaseFetcher {
    //MARK: - Properties
    let networkFetcher: NetworkFetcher
    let baseURL: URL
    
    
    //MARK: - Constructor
    init(networkFetcher: NetworkFetcher, baseURL: URL) {
        self.networkFetcher = networkFetcher
        self.baseURL = baseURL
    }
}


//MARK: - APIVersionControl implementation
extension BaseFetcher: APIVersionControl {
    public static var apiVersion: String {
        "v4"
    }
}
