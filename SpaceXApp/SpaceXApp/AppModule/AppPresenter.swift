//
//  AppPresenter.swift
//  Presentation
//
//  Created by Ramon Haro Marques on 19/05/2021.
//

import Foundation
import Data
import Routing

public protocol AppPresenterInterface {
    func setupApplication()
}

public protocol AppPresenterOutput: class {}


public class AppPresenter {
    //MARK: - Properties
    let companyInfoFetcher: CompanyInfoFetcherInterface
    let launchesFetcher: LaunchesFetcherInterface
    let rocketFetcher: RocketFetcherInterface
    let router: AppRouterInterface
    
    weak public var output: AppPresenterOutput?
    
    
    //MARK: - Constructor
    public init(companyInfoFetcher: CompanyInfoFetcherInterface,
                launchesFetcher: LaunchesFetcherInterface,
                rocketFetcher: RocketFetcherInterface,
                router: AppRouterInterface) {
        self.companyInfoFetcher = companyInfoFetcher
        self.launchesFetcher = launchesFetcher
        self.rocketFetcher = rocketFetcher
        
        
        self.router = router
    }
}


//MARK: - AppPresenterInterface implementation
extension AppPresenter: AppPresenterInterface {
    public func setupApplication() {
        //Some others in the future
        
        router.routeGeneralInfo(companyInfoFetcher: companyInfoFetcher, launchesFetcher: launchesFetcher, rocketFetcher: rocketFetcher)
    }
}
