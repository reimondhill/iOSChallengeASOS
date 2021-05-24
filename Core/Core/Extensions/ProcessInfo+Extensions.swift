//
//  ProcessInfo+Extensions.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension ProcessInfo {
    var isUITesting: Bool {
        if let testing = environment["isTesting"],
           testing == "true" {
            return true
        } else {
            return false
        }
    }
}
