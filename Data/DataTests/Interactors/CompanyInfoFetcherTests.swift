//
//  CompanyInfoFetcherTests.swift
//  DataTests
//
//  Created by Ramon Haro Marques
//

import XCTest
@testable import Data
@testable import Core

class CompanyInfoFetcherTests: XCTestCase {
    //MARK: - Properties
    let baseURL: URL = URL(string: "http://some.where")!
    var networkFetcher = MockNetworkManager()
    var companyInfo = EntityFactory.spaceXCompanyInfo
        
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    //MARK: - Test functions
    func test_GivenValidRFCURLAndParams_WhenAppended_ThenAssertURLContainsParams() {
        networkFetcher.injectedCodable = companyInfo
        let companyInfoFetcher = CompanyInfoFetcher(networkFetcher: networkFetcher, baseURL: baseURL)
        
        let expectedURL: URL = baseURL.appendingPathComponent("v3").appendingPathComponent("info")
        let expectedHTTPMethodType: HTTPMethodType = .get
        let expectedHeaders: [String:String] = [:]
        //let expectedParams: [String:Any] = [:]
        
        companyInfoFetcher.getInfo { [weak self] result in
            switch result {
            case .success(_):
                XCTAssertEqual(expectedURL, self?.networkFetcher.spyURL)
                XCTAssertEqual(expectedHTTPMethodType, self?.networkFetcher.spyHTTPMethodType)
                XCTAssertEqual(expectedHeaders, self?.networkFetcher.spyHeaders)
                //XCTAssertEqual(expectedParams, self?.networkFetcher.spyParams)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
}
