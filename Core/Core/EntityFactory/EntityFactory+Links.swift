//
//  EntityFactory+Links.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension EntityFactory {
    /// Returns an instance of Links
    static let links: Links = Links(website: URL(string: "https://www.spacex.com/"),
                                    flickr: URL(string: "https://www.flickr.com/photos/spacex/"),
                                    twitter: URL(string: "https://twitter.com/SpaceX"),
                                    elonTwitter: URL(string: "https://twitter.com/elonmusk"))
}
