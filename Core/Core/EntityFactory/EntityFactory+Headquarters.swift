//
//  EntityFactory+Headquarters.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension EntityFactory {
    /// Returns an instance of Company Info based on SpaceX
    static let rocketRoadHeadquarters: Headquarters = Headquarters(address: "Rocket Road",
                                                                   city: "Hawthorne",
                                                                   state: "California")
    
}
