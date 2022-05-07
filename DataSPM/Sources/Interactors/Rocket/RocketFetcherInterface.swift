//
//  RocketFetcherInterface.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public protocol RocketFetcherInterface {
    /// Fetches all rockets
    /// - Parameters:
    ///   - completion: Callback called when the process finishes
    func fetchRockets(completion: @escaping (Result<[Rocket], Error>)->Void)
    
    /// Fetches a rocket by ID
    /// - Parameters:
    ///   - id: The rocket ID
    ///   - completion: Callback called when the process finishes
    func getRocket(id: String, completion: @escaping (Result<Rocket, Error>)->Void)
}
