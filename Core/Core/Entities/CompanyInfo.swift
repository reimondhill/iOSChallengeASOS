//
//  CompanyInfo.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public struct CompanyInfo {
    //MARK: - Properties
    let name: String
    let summary: String
    let founder: String
    let founded: Int
    let headquarters: Headquarters?
    let valuation: Int
    let employees: Int
    let vehicles: Int
    let launchSites: Int
    let testSites: Int
    let ceo: String
    let cto: String
    let coo: String
    let ctoPropulsion: String
    
    
    //MARK: - Constructor
    init(name: String, summary: String, founder: String, founded: Int, headquarters: Headquarters?, valuation: Int, employees: Int, vehicles: Int, launchSites: Int, testSites: Int, ceo: String, cto: String, coo: String, ctoPropulsion: String) {
        self.name = name
        self.summary = summary
        self.founder = founder
        self.founded = founded
        self.headquarters = headquarters
        self.valuation = valuation
        self.employees = employees
        self.vehicles = vehicles
        self.launchSites = launchSites
        self.testSites = testSites
        self.ceo = ceo
        self.cto = cto
        self.coo = coo
        self.ctoPropulsion = ctoPropulsion
    }
}

//MARK: - Codable implementation
extension CompanyInfo: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case summary
        case founder
        case founded
        case headquarters
        case valuation
        case employees
        case vehicles
        case launchSites = "launch_sites"
        case testSites = "test_sites"
        case ceo
        case cto
        case coo
        case ctoPropulsion = "cto_propulsion"
    }
}


//MARK: - Equatable implementation
extension CompanyInfo: Equatable {
    static public func ==(lhs: CompanyInfo, rhs: CompanyInfo) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.summary == rhs.summary &&
            lhs.founder == rhs.founder &&
            lhs.founded == rhs.founded &&
            lhs.headquarters == rhs.headquarters &&
            lhs.valuation == rhs.valuation &&
            lhs.employees == rhs.employees &&
            lhs.vehicles == rhs.vehicles &&
            lhs.launchSites == rhs.launchSites &&
            lhs.testSites == rhs.testSites &&
            lhs.ceo == rhs.ceo &&
            lhs.cto == rhs.cto &&
            lhs.coo == rhs.coo &&
            lhs.ctoPropulsion == rhs.ctoPropulsion
    }
}
