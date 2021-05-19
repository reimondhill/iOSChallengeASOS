//
//  AppRouter.swift
//  Routing
//
//  Created by Ramon Haro Marques on 19/05/2021.
//

import Foundation
import UIKit
import Data
//import Info

public protocol AppRouterInterface: Router {
//    func routeGeneralInfo(companyInfoFetcher: CompanyInfoFetcherInterface,
//                          launchesFetcher: LaunchesFetcherInterface,
//                          rocketFetcher: RocketFetcherInterface)
}

public class AppRouter: AppRouterInterface {
    //MARK: - Properties
    let window: UIWindow
    var navigationController: UINavigationController?
    
    //MARK: - Constructor
    public init(window: UIWindow) {
        self.window = window
    }
    
    
    //MARK: - AppRouterInterface imlementation
    public var parent: Router?
    
    public func start() {
        navigationController = UINavigationController()
    }
    
//    public func routeGeneralInfo(companyInfoFetcher: CompanyInfoFetcherInterface, launchesFetcher: LaunchesFetcherInterface, rocketFetcher: RocketFetcherInterface) {
//        
//    }
}
