//
//  Launch+Links.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

extension Launch {
    public struct Links {
        //MARK: - Properties
        public let presskitURL: URL?
        public let webcastURL: URL?
        public let youtubeID: String?
        public let articleURL: URL?
        public let wikipediaURL: URL?
        
        public let patch: Launch.Links.Patch?
        
        
        //MARK: - Constructor
        init(presskitURL: URL?, webcastURL: URL?, youtubeID: String?, articleURL: URL?, wikipediaURL: URL?, patch: Launch.Links.Patch?) {
            self.presskitURL = presskitURL
            self.webcastURL = webcastURL
            self.youtubeID = youtubeID
            self.articleURL = articleURL
            self.wikipediaURL = wikipediaURL
            self.patch = patch
        }
    }
}


//MARK: - Codable implementation
extension Launch.Links: Codable {
    enum CodingKeys: String, CodingKey {
        case presskitURL = "presskit"
        case webcastURL = "webcast"
        case youtubeID = "youtube_id"
        case articleURL = "article"
        case wikipediaURL = "wikipedia"
        case patch
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        presskitURL = try container.decodeIfPresent(URL.self, forKey: CodingKeys.presskitURL)
        webcastURL = try container.decodeIfPresent(URL.self, forKey: CodingKeys.webcastURL)
        youtubeID = try container.decodeIfPresent(String.self, forKey: CodingKeys.youtubeID)
        articleURL = try container.decodeIfPresent(URL.self, forKey: CodingKeys.articleURL)
        wikipediaURL = try container.decodeIfPresent(URL.self, forKey: CodingKeys.wikipediaURL)
        patch = try container.decodeIfPresent(Launch.Links.Patch.self, forKey: CodingKeys.patch)
    }
}


//MARK: - Equatable implementation
extension Launch.Links: Equatable {
    public static func ==(lhs: Launch.Links, rhs: Launch.Links) -> Bool {
        return
            lhs.presskitURL == rhs.presskitURL &&
            lhs.webcastURL == rhs.webcastURL &&
            lhs.youtubeID == rhs.youtubeID &&
            lhs.articleURL == rhs.articleURL &&
            lhs.wikipediaURL == rhs.wikipediaURL &&
            lhs.patch == rhs.patch
    }
}
