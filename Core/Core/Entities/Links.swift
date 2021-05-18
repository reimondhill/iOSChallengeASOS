//
//  Links.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public struct Links {
    //MARK: - Properties
    let website: URL?
    let flickr: URL?
    let twitter: URL?
    let elonTwitter: URL?

    
    //MARK: - Constructor
    init(website: URL?, flickr: URL?, twitter: URL?, elonTwitter: URL?) {
        self.website = website
        self.flickr = website
        self.twitter = twitter
        self.elonTwitter = elonTwitter
    }
}


//MARK: - Codable implementation
extension Links: Codable {
    enum CodingKeys: String, CodingKey {
        case website
        case flickr
        case twitter
        case elonTwitter = "elon_twitter"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        website = try container.decodeIfPresent(URL.self, forKey: CodingKeys.website)
        flickr = try container.decodeIfPresent(URL.self, forKey: CodingKeys.flickr)
        twitter = try container.decodeIfPresent(URL.self, forKey: CodingKeys.twitter)
        elonTwitter = try container.decodeIfPresent(URL.self, forKey: CodingKeys.elonTwitter)
    }
}


//MARK: - Equatable implementation
extension Links: Equatable {
    public static func ==(lhs: Links, rhs: Links) -> Bool {
        return
            lhs.website == rhs.website &&
            lhs.flickr == rhs.flickr &&
            lhs.twitter == rhs.twitter &&
            lhs.elonTwitter == rhs.elonTwitter
    }
}
