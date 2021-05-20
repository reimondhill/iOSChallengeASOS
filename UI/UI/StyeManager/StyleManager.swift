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
            standard.backgroundColor = UIColor.navigationBackground
            standard.titleTextAttributes = [.foregroundColor: UIColor.navigationTint]
            
            let button = UIBarButtonItemAppearance(style: .plain)
            button.normal.titleTextAttributes = [.foregroundColor: UIColor.navigationTint]
            standard.buttonAppearance = button
            
            UINavigationBar.appearance().standardAppearance = standard
        } else {
            let appearance = UINavigationBar.appearance()
            appearance.backgroundColor = UIColor.navigationBackground
            appearance.barTintColor = UIColor.navigationBackground
            appearance.tintColor = UIColor.navigationTint
            
            appearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.navigationTint
            ]
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.navigationTint
            ]
        }
    }
}
