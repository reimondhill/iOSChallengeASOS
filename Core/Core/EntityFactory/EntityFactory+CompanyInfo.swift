//
//  EntityFactory+CompanyInfo.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension EntityFactory {
    /// Returns an instance of Company Info based on SpaceX
    static let spaceXCompanyInfo: CompanyInfo = CompanyInfo(name: "SpaceX",
                                                            summary: "SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets.",
                                                            founder: "Elon Musk",
                                                            founded: 2002,
                                                            headquarters: EntityFactory.rocketRoadHeadquarters,
                                                            valuation: 27500000000,
                                                            employees: 7000,
                                                            vehicles: 3,
                                                            launchSites: 3,
                                                            testSites: 1,
                                                            ceo: "Elon Musk",
                                                            cto: "Elon Musk",
                                                            coo: "Gwynne Shotwell",
                                                            ctoPropulsion: "Tom Mueller")
}
