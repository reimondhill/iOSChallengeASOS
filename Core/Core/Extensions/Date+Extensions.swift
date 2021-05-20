//
//  Date+Extensions.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension Date {
    /// It returns the date as String formatted like 'Feb 23, 2019'
    var monthDayYear: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: self)
    }
    
    /// Returns the number of days from another date
    /// - Parameters:
    ///   - date: Date to compare
    /// - Returns: The number of days. Negatve means past, Positive means future
    func days(from date: Date) -> Int {
        return Int(date.timeIntervalSince1970 - self.timeIntervalSince1970) / (60*60*24)
    }
}
