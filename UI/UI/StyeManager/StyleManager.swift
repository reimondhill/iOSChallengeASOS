//
//  StyleManager.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public class StyleManager {
    public static func setupNavigationStyle() {
        if #available(iOS 13.0, *) {
            let standard = UINavigationBarAppearance()
            
            standard.configureWithOpaqueBackground()
            standard.backgroundColor = UIColor.navigationBackgroundColor
            standard.titleTextAttributes = [.foregroundColor: UIColor.navigationTintColor]
            
            let button = UIBarButtonItemAppearance(style: .plain)
            button.normal.titleTextAttributes = [.foregroundColor: UIColor.navigationTintColor]
            standard.buttonAppearance = button
            
            UINavigationBar.appearance().standardAppearance = standard
        } else {
            // Fallback on earlier versions
        }
    }
}
