//
//  Date+Extensions.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension Date {
    /// Returns the year component as 4 characters string
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: self)
    }
    
    /// It returns the date as String formatted like 'Feb 29, 2022 'at' HH:MM:SS'
    func monthDayYearAtHour(separator: String = "@") -> String {
        let dateFormatter = DateFormatter()
        //"'MMM' 'd', 'yyyy' at 'HH:mm:ss'"
        dateFormatter.dateFormat = "MMM' 'd', 'yyyy' \(separator) 'HH:mm:ss"
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
