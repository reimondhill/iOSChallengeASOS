//
//  Launch.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public struct Launch {
    //MARK: - Properties
    let id: String
    let name: String
    let details: String?
    let flightNumber: Int
    let success: Bool?
    let launchpad: String
    
    let fireUTCDate: String?
    let fireDateEpoch: Int?
    let dateUTC: String?
    let dateEpoch: Int?
    let dateLocal: String?
    let datePrecision: DatePrecision
    
    let crew:[String]
    let ships:[String]
    let capsules:[String]
    let payloads: [String]
    let autoUpdate: Bool
    let launchLibraryID: String?
    let tbd: Bool
    let net: Bool
    let window: Int
    let rocket: String

    let links: Launch.Links?
    //let cores: [Launc.Core]
    //let fairings: Launch.Fairings?
    //let failures: [Launch.Failure]?
    
    
    //MARK: - Constructor
    init(id: String, name: String, details: String?, flightNumber: Int, success: Bool?, launchpad: String, fireUTCDate: String?, fireDateEpoch: Int?, dateUTC: String?, dateEpoch: Int?, dateLocal: String?, datePrecision: DatePrecision, crew:[String], ships:[String], capsules:[String], payloads: [String], autoUpdate: Bool, launchLibraryID: String?, tbd: Bool, net: Bool, window: Int, rocket: String, links: Launch.Links?) {
        self.id = id
        self.name = name
        self.details = details
        self.flightNumber = flightNumber
        self.success = success
        self.launchpad = launchpad
        
        self.fireUTCDate = fireUTCDate
        self.fireDateEpoch = fireDateEpoch
        self.dateUTC = dateUTC
        self.dateEpoch = dateEpoch
        self.dateLocal = dateLocal
        self.datePrecision = datePrecision
        
        self.crew = crew
        self.ships = ships
        self.capsules = capsules
        self.payloads = payloads
        self.autoUpdate = autoUpdate
        self.launchLibraryID = launchLibraryID
        self.tbd = tbd
        self.net = net
        self.window = window
        self.rocket = rocket
        
        self.links = links
    }
}


//MARK: - Codable implementation
extension Launch: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case details
        case flightNumber = "flight_number"
        case success
        case launchpad
        
        case fireUTCDate = "static_fire_date_utc"
        case fireDateEpoch = "static_fire_date_unix"
        case dateUTC = "date_utc"
        case dateEpoch = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        
        case crew
        case ships
        case capsules
        case payloads
        case autoUpdate = "auto_update"
        case launchLibraryID = "launch_library_id"
        case tbd
        case net
        case window
        case rocket
        
        case links
        //case cores
        //case fairings
        //case failures
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: CodingKeys.id)
        name = try container.decode(String.self, forKey: CodingKeys.name)
        details = try container.decodeIfPresent(String.self, forKey: CodingKeys.details)
        flightNumber = try container.decode(Int.self, forKey: CodingKeys.flightNumber)
        success = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.success)
        launchpad = try container.decode(String.self, forKey: CodingKeys.launchpad)
        
        fireUTCDate = try container.decodeIfPresent(String.self, forKey: CodingKeys.fireUTCDate)
        fireDateEpoch = try container.decodeIfPresent(Int.self, forKey: CodingKeys.fireDateEpoch)
        dateUTC = try container.decodeIfPresent(String.self, forKey: CodingKeys.dateUTC)
        dateEpoch = try container.decodeIfPresent(Int.self, forKey: CodingKeys.dateEpoch)
        dateLocal = try container.decodeIfPresent(String.self, forKey: CodingKeys.dateLocal)
        datePrecision = try container.decode(DatePrecision.self, forKey: CodingKeys.datePrecision)
        
        crew = try container.decodeIfPresent([String].self, forKey: CodingKeys.crew) ?? []
        ships = try container.decodeIfPresent([String].self, forKey: CodingKeys.ships) ?? []
        capsules = try container.decodeIfPresent([String].self, forKey: CodingKeys.capsules) ?? []
        payloads = try container.decodeIfPresent([String].self, forKey: CodingKeys.payloads) ?? []
        autoUpdate = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.autoUpdate) ?? false
        launchLibraryID = try container.decodeIfPresent(String.self, forKey: CodingKeys.launchLibraryID)
        tbd = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.tbd) ?? false
        net = try container.decodeIfPresent(Bool.self, forKey: CodingKeys.net) ?? false
        window = try container.decodeIfPresent(Int.self, forKey: CodingKeys.window) ?? 0
        rocket = try container.decodeIfPresent(String.self, forKey: CodingKeys.rocket) ?? ""
        
        links = try container.decodeIfPresent(Launch.Links.self, forKey: CodingKeys.links)
    }
}


//MARK: - Equatable implementation
extension Launch: Equatable {
    public static func ==(lhs: Launch, rhs: Launch) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.details == rhs.details &&
            lhs.flightNumber == rhs.flightNumber &&
            lhs.success == rhs.success &&
            lhs.crew == rhs.crew &&
            lhs.ships == rhs.ships &&
            lhs.capsules == rhs.capsules &&
            lhs.launchpad == rhs.launchpad &&
            lhs.fireUTCDate == rhs.fireUTCDate &&
            lhs.fireDateEpoch == rhs.fireDateEpoch &&
            lhs.dateUTC == rhs.dateUTC &&
            lhs.dateEpoch == rhs.dateEpoch &&
            lhs.dateLocal == rhs.dateLocal &&
            lhs.datePrecision == rhs.datePrecision &&
            lhs.payloads == rhs.payloads &&
            lhs.autoUpdate == rhs.autoUpdate &&
            lhs.launchLibraryID == rhs.launchLibraryID &&
            lhs.tbd == rhs.tbd &&
            lhs.net == rhs.net &&
            lhs.window == rhs.window &&
            lhs.rocket == rhs.rocket &&
            lhs.links == rhs.links
    }
}
