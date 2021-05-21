//
//  LaunchPresentableItemInfoTests.swift
//  PresentationTests
//
//  Created by Ramon Haro Marques on 21/05/2021.
//

import XCTest
@testable import Core
@testable import Presentation

class LaunchPresentableItemInfoTests: XCTestCase {
    //MARK: - Properties
    private let gmtTimeZone = TimeZone(abbreviation: "GMT")!
    
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
    func test_GivenLaunchPresentableItem_AssertInitWithLaunchAndRocket() {
        let launch = EntityFactory.crew1Launch
        let rocket = EntityFactory.falcon1Rocket
        
        let launchPresentableItemInfo = LaunchPresentableItemInfo(launch: launch, rocket: rocket, dateSeparator: "at")
        
        XCTAssertEqual(launchPresentableItemInfo.mission, "Crew-1")
        XCTAssertEqual(launchPresentableItemInfo.date, "Nov 11, 2020 at 16:17:00")
        XCTAssertEqual(launchPresentableItemInfo.rocket, "Falcon 1 / Rocket")
        XCTAssertEqual(launchPresentableItemInfo.logoImageURL, URL(string: "https://imgur.com/6RnqgLW.png"))
        XCTAssertEqual(launchPresentableItemInfo.status, .succes)
    }
    
    func test_GivenLaunchPresentableItem_AssertInitWithLaunchAndRocketUnknown() {
        let launch = EntityFactory.sv05Launch
        let rocket = EntityFactory.falconHeavyRocket
        
        let launchPresentableItemInfo = LaunchPresentableItemInfo(launch: launch, rocket: rocket, dateSeparator: "at")
        
        XCTAssertEqual(launchPresentableItemInfo.mission, "GPS III SV05")
        XCTAssertEqual(launchPresentableItemInfo.date, "Jun 17, 2021 at 22:00:00")
        XCTAssertEqual(launchPresentableItemInfo.rocket, "Falcon Heavy / Unknown")
        XCTAssertEqual(launchPresentableItemInfo.logoImageURL, URL(string: "https://imgur.com/6RnqgLW.png"))
        XCTAssertEqual(launchPresentableItemInfo.status, .unknown)
    }

}
