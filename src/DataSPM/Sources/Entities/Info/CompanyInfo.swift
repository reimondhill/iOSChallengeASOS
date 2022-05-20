//
//  CompanyInfo.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public struct CompanyInfo {
    //MARK: - Properties
    public let id: String
    public let name: String
    public let summary: String
    public let founder: String
    public let founded: Int
    public let headquarters: Headquarters
    public let valuation: Int
    public let employees: Int
    public let vehicles: Int
    public let launchSites: Int
    public let testSites: Int
    public let ceo: String
    public let cto: String
    public let coo: String
    public let ctoPropulsion: String
    public let links: Links?
    
    
    //MARK: - Constructor
    public init(id: String, name: String, summary: String, founder: String, founded: Int, headquarters: Headquarters, valuation: Int, employees: Int, vehicles: Int, launchSites: Int, testSites: Int, ceo: String, cto: String, coo: String, ctoPropulsion: String, links: Links) {
        self.id = id
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
        self.links = links
    }
}

//MARK: - Codable implementation
extension CompanyInfo: Codable {
    enum CodingKeys: String, CodingKey {
        case id
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
        case links
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: CodingKeys.id)
        name = try container.decode(String.self, forKey: CodingKeys.name)
        summary = try container.decode(String.self, forKey: CodingKeys.summary)
        founder = try container.decode(String.self, forKey: CodingKeys.founder)
        founded = try container.decode(Int.self, forKey: CodingKeys.founded)
        headquarters = try container.decode(Headquarters.self, forKey: CodingKeys.headquarters)
        valuation = try container.decode(Int.self, forKey: CodingKeys.valuation)
        employees = try container.decode(Int.self, forKey: CodingKeys.employees)
        vehicles = try container.decode(Int.self, forKey: CodingKeys.vehicles)
        launchSites = try container.decode(Int.self, forKey: CodingKeys.launchSites)
        testSites = try container.decode(Int.self, forKey: CodingKeys.testSites)
        ceo = try container.decode(String.self, forKey: CodingKeys.ceo)
        cto = try container.decode(String.self, forKey: CodingKeys.cto)
        coo = try container.decode(String.self, forKey: CodingKeys.coo)
        ctoPropulsion = try container.decode(String.self, forKey: CodingKeys.ctoPropulsion)
        links = try container.decodeIfPresent(Links.self, forKey: CodingKeys.links)
    }
}


//MARK: - Equatable implementation
extension CompanyInfo: Equatable {
    static public func ==(lhs: CompanyInfo, rhs: CompanyInfo) -> Bool {
        return
            lhs.id == rhs.id &&
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
            lhs.ctoPropulsion == rhs.ctoPropulsion &&
            lhs.links == rhs.links
    }
}
