//
//  ErrorRouter.swift
//  Routing
//
//  Created by Ramon Haro Marques
//

import Foundation


public protocol ErrorRouter {
    func showError(title: String, message: String?)
}
