//
//  AppDelegate.swift
//  SpaceXApp
//
//  Created by Ramon Haro Marques
//

import UIKit
import Data
import Info

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: - Properties
    static let shared: AppDelegate  = UIApplication.shared.delegate as! AppDelegate
    
    var window: UIWindow?
    
    
    //MARK: - UIApplicationDelegate implementation
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //TEMP HERE!!!
        let baseURL = URL(string: "https://api.spacexdata.com")!
        let networkFetcher = NativeNetworkManager()
        window?.rootViewController = Info.InfoGeneralModule.initialise(host: UIViewController(),
                                                                       companyFetcher: CompanyInfoFetcher(networkFetcher: networkFetcher, baseURL: baseURL),
                                                                       launchesFetcher: LaunchesFetcher(networkFetcher: networkFetcher, baseURL: baseURL))
        window?.makeKeyAndVisible()
        
        return true
    }
}

