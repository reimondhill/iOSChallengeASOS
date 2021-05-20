//
//  LaunchPresentableItem.swift
//  Presentation
//
//  Created by Ramon Haro Marques
//

import Foundation
import Core

public struct LaunchPresentableItemInfo {
    //MARK: - Class model
    public enum Status: CaseIterable {
        case succes
        case failed
        case unknown
    }
    
    //MARK: - Properties
    public let mission: String
    public let date: String
    public let rocket: String
    public let days: Int
    public let logoImageURL: URL?
    public let status: Status
    
    
    //MARK: - Constructor
    public init(launch: Launch, dateSeparator: String) {
        self.mission = launch.name
        
        if let epoch = launch.fireDateEpoch ?? launch.dateEpoch {
            let launchDate = Date(timeIntervalSince1970: TimeInterval(epoch))
            self.date = launchDate.monthDayYearAtHour(separator: dateSeparator)
            self.days = Date().days(from: launchDate)
        } else {
            self.date = "-"
            self.days = 0
        }
        
        self.rocket = "N/A"
        
        self.logoImageURL = launch.links?.patch?.smallURL ?? launch.links?.patch?.largeURL
        
        if let success = launch.success {
            self.status = success ? .succes:.failed
        } else {
            self.status = .unknown
        }
    }
}

public protocol LaunchPresentableItem {
    func setup(launchItem: LaunchPresentableItemInfo)
}
