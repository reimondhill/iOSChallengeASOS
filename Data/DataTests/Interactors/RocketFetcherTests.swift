//
//  RocketFetcherTests.swift
//  DataTests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import Core
@testable import Data

class RocketFetcherTests: BaseDataTest {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        networkFetcher.injectedCodable = nil
    }
    
    
    //MARK: - Test functions
    func test_GivenRocketFetcher_T() {
        let injectedRocket: Rocket = EntityFactory.falcon1Rocket
        networkFetcher.injectedCodable = injectedRocket
        
        let rocketFetcher = RocketFetcher(networkFetcher: networkFetcher, baseURL: baseURL)
        
        let expectedURL: URL = baseURL
            .appendingPathComponent(RocketFetcher.apiVersion)
            .appendingPathComponent(RocketFetcher.Endpoints.allRockets.rawValue)
            .appendingPathComponent(injectedRocket.id)
        let expectedHTTPMethodType: HTTPMethodType = .get
        
        expect(description: "Testing RocketFetcher", completion: { [weak self] expectation in
            rocketFetcher.getRocket(id: injectedRocket.id, completion: { result in
                switch result {
                case .success(let rocket):
                    XCTAssertEqual(rocket, injectedRocket)
                    XCTAssertEqual(expectedURL, self?.networkFetcher.spyURL)
                    XCTAssertEqual(expectedHTTPMethodType, self?.networkFetcher.spyHTTPMethodType)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
                
                expectation.fulfill()
            })
        })
        
    }
}
