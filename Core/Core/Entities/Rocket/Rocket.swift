//
//  Rocket.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public struct Rocket {
    //MARK: - Properties
    public let id: String
    public let name: String
    
    
    //MARK: - Constructor
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}


//MARK: - Codable implementation
extension Rocket: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: CodingKeys.id)
        name = try container.decode(String.self, forKey: CodingKeys.name)
    }
}


//MARK: - Equatable implementation
extension Rocket: Equatable {
    public static func ==(lhs: Rocket, rhs: Rocket) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name
    }
}
