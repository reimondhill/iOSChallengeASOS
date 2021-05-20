//
//  CompanyInfoFetcherInterface.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public protocol CompanyInfoFetcherInterface {
    /// Fetches the company information
    /// - Parameters:
    ///   - completion: Callback called when the process finishes
    func getInfo(completion: @escaping (Result<CompanyInfo, Error>)->Void)
}
