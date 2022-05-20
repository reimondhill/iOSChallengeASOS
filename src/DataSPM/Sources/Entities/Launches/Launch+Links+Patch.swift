//
//  Launch+Links+Patch.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

extension Launch.Links {
    public struct Patch {
        public let smallURL: URL?
        public let largeURL: URL?
    }
}


//MARK: - Codable implementation
extension Launch.Links.Patch: Codable {
    enum CodingKeys: String, CodingKey {
        case smallURL = "small"
        case largeURL = "large"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        smallURL = try container.decodeIfPresent(URL.self, forKey: CodingKeys.smallURL)
        largeURL = try container.decodeIfPresent(URL.self, forKey: CodingKeys.largeURL)
    }
}


//MARK: - Equatable implementation
extension Launch.Links.Patch: Equatable {
    public static func ==(lhs: Launch.Links.Patch, rhs: Launch.Links.Patch) -> Bool {
        return
            lhs.smallURL == rhs.smallURL &&
            lhs.largeURL == rhs.largeURL
    }
}
