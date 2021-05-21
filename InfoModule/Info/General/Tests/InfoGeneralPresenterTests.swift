//
//  InfoGeneralPresenterTests.swift
//  InfoTests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import Core
@testable import Data
@testable import Info

class InfoGeneralPresenterTests: XCTestCase {
    //MARK: - Properties
    let baseURL = URL(string: "https://right.here")!
    
    let companyInfo = EntityFactory.spaceXCompanyInfo
    let launches = [EntityFactory.sv05Launch, EntityFactory.crew1Launch]
    let rockets = [EntityFactory.falcon1Rocket, EntityFactory.falconHeavyRocket]
    
    var comapanyNetworkFetcher = MockNetworkManager()
    var companyFetcher: CompanyInfoFetcher!
    
    var launchesNetworkFetcher = MockNetworkManager()
    var launchesFetcher: LaunchesFetcher!
    
    var rocketNetworkFetcher = MockNetworkManager()
    var rocketFetcher: RocketFetcher!
    
    var router = MockInfoGeneralRouter()
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        comapanyNetworkFetcher.injectedCodable = companyInfo
        companyFetcher = CompanyInfoFetcher(networkFetcher: comapanyNetworkFetcher, baseURL: baseURL)
        
        launchesNetworkFetcher.injectedCodable = launches
        launchesFetcher = LaunchesFetcher(networkFetcher: launchesNetworkFetcher, baseURL: baseURL)
        
        rocketNetworkFetcher.injectedCodable = rockets
        rocketFetcher = RocketFetcher(networkFetcher: rocketNetworkFetcher, baseURL: baseURL)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    //MARK: - Test functions
    func test_GivenLaunchesResponse_ThenAssertInfoCorrect() {
        let presenter = InfoGeneralPresenter(companyFetcher: companyFetcher,
                                             launchesFetcher: launchesFetcher,
                                             rocketFetcher: rocketFetcher,
                                             router: router)
        presenter.reload(silently: false)
        let expectationItem = expectation(description: description)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            XCTAssertEqual(presenter.numberOfSections(), 2)
            XCTAssertEqual(presenter.numberOfItems(section: 0), 1)
            XCTAssertEqual(presenter.numberOfItems(section: 1), 2)
            
            expectationItem.fulfill()
        })
        
        wait(for: [expectationItem], timeout: 5)
    }
}
