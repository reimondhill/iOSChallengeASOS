//
//  DatePrecision.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public enum DatePrecision: String, CaseIterable {
    case day
    case hour
    case minute
    case second
    case unknown
    
    public init(rawValue: String) {
        switch rawValue.lowercased() {
        case "day":
            self = .day
        case "hour":
            self = .hour
        case "minute":
            self = .minute
        case "second":
            self = .second
        default:
            self = .unknown
        }
    }
}


//MARK: - Codable implementation
extension DatePrecision: Codable {
    public init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = DatePrecision(rawValue: label)
    }
}
