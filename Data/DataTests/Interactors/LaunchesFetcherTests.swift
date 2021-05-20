//
//  LaunchesFetcherTests.swift
//  DataTests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import Core
@testable import Data

class LaunchesFetcherTests: BaseDataTest {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        networkFetcher.injectedCodable = nil
    }

    
    //MARK: - Test functions
    func test_GivenLaunchesFetcher_ThenAssertCorrectConfigurationAndCompletion() {
        let injectedResponse: [Launch] = [EntityFactory.sv05Launch]
        networkFetcher.injectedCodable = injectedResponse
        
        let launchesFetcher = LaunchesFetcher(networkFetcher: networkFetcher, baseURL: baseURL)
        
        let expectedURL: URL = baseURL
            .appendingPathComponent(LaunchesFetcher.apiVersion)
            .appendingPathComponent(LaunchesFetcher.Endpoints.allLaunches.rawValue)
        let expectedHTTPMethodType: HTTPMethodType = .get        
        
        expect(description: "Testing LaunchesFetcher", completion: { [weak self] expectation in
            launchesFetcher.getLaunch { result in
                switch result {
                case .success(let launches):
                    XCTAssertEqual(launches, injectedResponse)
                    XCTAssertEqual(expectedURL, self?.networkFetcher.spyURL)
                    XCTAssertEqual(expectedHTTPMethodType, self?.networkFetcher.spyHTTPMethodType)
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
                
                expectation.fulfill()
            }
        })
    }
}
