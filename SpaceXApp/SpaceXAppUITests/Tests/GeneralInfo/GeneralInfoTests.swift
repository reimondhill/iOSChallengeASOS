//
//  GeneralInfoTests.swift
//  SpaceXAppUITests
//
//  Created by Ramon Haro Marques on 23/05/2021.
//

import XCTest
@testable import Core

class GeneralInfoTests: BaseFeature {
    //MARK: - Properties
    lazy var companyInfo = EntityFactory.spaceXCompanyInfo
    lazy var launches = [EntityFactory.crew1Launch, EntityFactory.sv05Launch]
    lazy var rockets = [EntityFactory.falcon1Rocket, EntityFactory.falconHeavyRocket]
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        requests["/v4/company"] = try RequestResponsePair(response: companyInfo)
        requests["/v4/launches"] = try RequestResponsePair(response: launches)
        requests["/v4/rockets"] = try RequestResponsePair(response: rockets)
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    
    //MARK: - Test functions
    func test_GeneralInfoListSetup() {
        let exp = expectation(description: "Foo")
        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {
            guard let table = self.app?.tables.firstMatch else {
                XCTFail("Invalid layout")
                return
            }
            
            XCTAssert(table.otherElements["Company Info"].exists)
            XCTAssert(table.otherElements["Launches"].exists)
            XCTAssertEqual(table.cells.count, 3)
            
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 25)
        XCTAssertEqual(1, 1)
    }
}
