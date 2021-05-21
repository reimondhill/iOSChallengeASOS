//
//  Rocket+Group.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension Rocket {
    enum Group: String, CaseIterable {
        case rocket
        case unknown
        
        public init(rawValue: String) {
            switch rawValue.lowercased() {
            case "rocket":
                self = .rocket
            default:
                self = .unknown
            }
        }
    }
}


//MARK: - Codable implementation
extension Rocket.Group: Codable {
    public init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = Rocket.Group(rawValue: label)
    }
}
