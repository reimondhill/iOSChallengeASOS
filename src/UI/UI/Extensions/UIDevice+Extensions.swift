//
//  UIDevice+Extensions.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public extension UIDevice {
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
}
