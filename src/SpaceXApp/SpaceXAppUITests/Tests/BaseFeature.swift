//
//  BaseFeature .swift
//  SpaceXAppUITests
//
//  Created by Ramon Haro Marques
//

import XCTest
//@testable import Core
//@testable import Data
//@testable import Presentation

class BaseFeature: XCTestCase {
    //MARK: - Properties
    lazy var app: XCUIApplication? = {
        let app = XCUIApplication()
        
        return app
    }()
    
    lazy var requests = [String: RequestResponsePair]()
    
    
    //MARK: - Override methods
    override func setUpWithError() throws {
        try configureEnvironmentLaunchArguments(for: app!)
        app!.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
}


//MARK: - Internal methods
internal extension BaseFeature {
    func configureEnvironmentLaunchArguments(for app: XCUIApplication) throws {
        try requests.forEach({ (requestVariation) in
            let data = try JSONEncoder().encode(requestVariation.value)
            
            let encodedKey = requestVariation.key
            app.launchEnvironment[encodedKey] = data.base64EncodedString()
        })
        
        app.launchEnvironment["isTesting"] = "true"
    }
}
