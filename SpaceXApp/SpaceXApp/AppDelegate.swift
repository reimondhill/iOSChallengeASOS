//
//  AppDelegate.swift
//  SpaceXApp
//
//  Created by Ramon Haro Marques
//

import UIKit
import Info

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: - Properties
    static let shared: AppDelegate  = UIApplication.shared.delegate as! AppDelegate
    
    var window: UIWindow?
    
    
    //MARK: - UIApplicationDelegate implementation
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Info.InfoGeneralModule.initialise(host: UIViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}

