//
//  LaunchItemTableViewCellTests.swift
//  UITests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import Core
@testable import Presentation
@testable import UI

class LaunchItemTableViewCellTests: XCTestCase {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - Test functions
    func test_CompanyInfoTableViewCell_AssertContent() {
        let configuration = BaseTableViewCell.Configuration.default
        let launch = EntityFactory.sv05Launch
        let rocket = EntityFactory.falcon1Rocket
        
        let cell = LaunchItemTableViewCell(frame: .zero)
        let launchPresentableItemInfo = LaunchPresentableItemInfo(launch: launch, rocket: rocket, dateSeparator: "at")
        cell.setup(launchItem: launchPresentableItemInfo)
        
        XCTAssertEqual(cell.missionLabel.text, launchPresentableItemInfo.mission)
        XCTAssertEqual(cell.dateLabel.text, launchPresentableItemInfo.date)
        XCTAssertEqual(cell.rocketLabel.text, launchPresentableItemInfo.rocket)
        XCTAssertEqual(cell.daysLabel.text, String(launchPresentableItemInfo.days))
        
        XCTAssertEqual(cell.backgroundColor, configuration.backgroundColor)
        XCTAssertEqual(cell.selectedBackgroundView?.backgroundColor, configuration.selectedBackgroundColor)
    }
}
