//
//  DateExtensionsTests.swift
//  CoreTests
//
//  Created by Ramon Haro Marques
//

import XCTest

@testable import Utilities

class DateExtensionsTests: XCTestCase {
    //MARK: - Properties
    private let gmtTimeZone = TimeZone(abbreviation: "GMT")!
    
    /// Epoch 21/04/1986 at 17:00:00
    private let epoch1: TimeInterval = 514486800
    
    /// Epoch 01/01/2021 at 00:00:00
    private let epoch2: TimeInterval = 1609459200
    
    /// Epoch 31/12/2020 at 23:59:59
    private let epoch3: TimeInterval = 1609459199
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        TimeZone.ReferenceType.default = gmtTimeZone
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        //Restart to current
        TimeZone.ReferenceType.default = TimeZone.current
    }
    
    
    //MARK: - Test functions
    func test_GivenDate_ThenAssertYearComponent() {
        let date1 = Date(timeIntervalSince1970: epoch1)
        XCTAssertEqual(date1.year, "1986")
        
        let date2 = Date(timeIntervalSince1970: epoch2)
        XCTAssertEqual(date2.year, "2021")
        
        let date3 = Date(timeIntervalSince1970: epoch3)
        XCTAssertEqual(date3.year, "2020")
    }
    
//    func test_GivenDate_ThenAssertMonthDayYearAtHour() {
//        let date1 = Date(timeIntervalSince1970: epoch1)
//        XCTAssertEqual(date1.monthDayYearAtHour(separator: "a"), "Apr 21, 1986 a 17:00:00")
//    }
//    
    func test_GivenDate_ThenAssertDaysFromAnotherDate() {
        let date1 = Date(timeIntervalSince1970: epoch1)
        
        let datePlus24h = Date(timeIntervalSince1970: epoch1+(60*60*24))
        XCTAssertEqual(date1.days(from: datePlus24h), 1)
        
        let datePlus23h = Date(timeIntervalSince1970: epoch1+(60*60*23))
        XCTAssertEqual(date1.days(from: datePlus23h), 0)
        
        let dateMinus24h = Date(timeIntervalSince1970: epoch1-(60*60*24))
        XCTAssertEqual(date1.days(from: dateMinus24h), -1)
    }
}
