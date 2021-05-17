//
//  Headquarters.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public struct Headquarters {
    //MARK: - Properties
    let address: String
    let city: String
    let state: String
    
    
    //MARK: - Constructor
    init(address: String, city: String, state: String) {
        self.address = address
        self.city = city
        self.state = state
    }
}


//MARK: - Codable implementation
extension Headquarters: Codable {
    enum CodingKeys: String, CodingKey {
        case address
        case city
        case state
    }
}


//MARK: - Equatable implementation
extension Headquarters: Equatable {
    public static func ==(lhs: Headquarters, rhs: Headquarters) -> Bool {
        return
            lhs.address == rhs.address &&
            lhs.city == rhs.city &&
            lhs.state == rhs.state
    }
}
