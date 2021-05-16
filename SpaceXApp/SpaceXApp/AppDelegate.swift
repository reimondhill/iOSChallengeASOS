//
//  AppDelegate.swift
//  SpaceXApp
//
//  Created by Ramon Haro Marques on 15/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    //MARK: - Properties
    static let shared: AppDelegate  = UIApplication.shared.delegate as! AppDelegate
    
    var window: UIWindow?
    
    
    //MARK: - UIApplicationDelegate implementation
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

