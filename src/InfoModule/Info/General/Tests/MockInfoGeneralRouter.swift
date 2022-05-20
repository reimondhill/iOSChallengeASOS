//
//  MockInfoGeneralRouter.swift
//  InfoTests
//
//  Created by Ramon Haro Marques
//

import Foundation
import Info
import Routing

class MockInfoGeneralRouter: InfoGeneralRouterInterface, ErrorRouter, WebRouter {
    
    //MARK: InfoGeneralRouterInterface implementation
    var parent: Router?
    
    func start() {
        
    }
    
    func routeSelectorModule(options: [String], title: String, completion: @escaping (Int) -> ()) {
        
    }
    
    //MARK: InfoGeneralRouterInterface implementation
    func showError(title: String, message: String?) {
        
    }
    
    //MARK: WebRouter implementation
    func route(url: URL, type: WebRouterType) {
        
    }
}
