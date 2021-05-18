//
//  EntityFactory+CompanyInfo.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension EntityFactory {
    /// Returns an instance of Company Info based on SpaceX
    static let spaceXCompanyInfo: CompanyInfo = CompanyInfo(id: "5eb75edc42fea42237d7f3ed",
                                                            name: "SpaceX",
                                                            summary: "SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets.",
                                                            founder: "Elon Musk",
                                                            founded: 2002,
                                                            headquarters: EntityFactory.rocketRoadHeadquarters,
                                                            valuation: 74000000000,
                                                            employees: 9500,
                                                            vehicles: 4,
                                                            launchSites: 3,
                                                            testSites: 3,
                                                            ceo: "Elon Musk",
                                                            cto: "Elon Musk",
                                                            coo: "Gwynne Shotwell",
                                                            ctoPropulsion: "Tom Mueller",
                                                            links: EntityFactory.links)
}
