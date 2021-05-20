//
//  LaunchPresentableItem.swift
//  Presentation
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public struct LaunchPresentableItemInfo {
    //MARK: - Properties
    public let mission: String
    public let date: String
    public let rocket: String
    public let logoImageURL: URL?
    
    
    //MARK: - Constructor
    public init(launch: Launch) {
        self.mission = launch.name
        if let epoch = launch.fireDateEpoch ?? launch.dateEpoch {
            self.date = "\(Date(timeIntervalSince1970: TimeInterval(epoch)))"
        } else {
            self.date = ""
        }
        
        self.rocket = "-"
        self.logoImageURL = launch.links?.patch?.smallURL ?? launch.links?.patch?.largeURL
    }
}

public protocol LaunchPresentableItem {
    func setup(launchItem: LaunchPresentableItemInfo)
}
