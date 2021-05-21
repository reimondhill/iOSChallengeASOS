//
//  CompanyInfoFetcherTests.swift
//  DataTests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import Core
@testable import Data

class CompanyInfoFetcherTests: BaseDataTest {
    //MARK: - Properties
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        networkFetcher.injectedCodable = nil
    }

    
    //MARK: - Test functions
    func test_GivenCompanyInfoFetcher_ThenAssertCorrectConfigurationAndCompletion() {
        let injectedResponse: CompanyInfo = EntityFactory.spaceXCompanyInfo
        networkFetcher.injectedCodable = injectedResponse
        
        let companyInfoFetcher = CompanyInfoFetcher(networkFetcher: networkFetcher, baseURL: baseURL)
        
        let expectedURL: URL = baseURL
            .appendingPathComponent(CompanyInfoFetcher.apiVersion)
            .appendingPathComponent(CompanyInfoFetcher.Endpoints.info.rawValue)
        let expectedHTTPMethodType: HTTPMethodType = .get
        
        expect(description: "Testing CompanyInfoFetcher", completion: { [weak self] expectation in
            companyInfoFetcher.getInfo { [weak self] result in
                switch result {
                case .success(let companyInfo):
                    XCTAssertEqual(injectedResponse, companyInfo)
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
