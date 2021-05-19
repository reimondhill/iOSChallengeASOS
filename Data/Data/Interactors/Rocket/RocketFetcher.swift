//
//  RocketFetcher.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public class RocketFetcher: BaseFetcher {
   
}


//MARK: - RocketFetcherInterface implementation
extension RocketFetcher: RocketFetcherInterface {
    public func getRocket(id: String, completion: @escaping (Result<[Launch], Error>) -> Void) {
    }

}
