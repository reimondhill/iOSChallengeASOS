//
//  Router.swift
//  Routing
//
//  Created by Ramon Haro Marques
//

import Foundation

public protocol Router: AnyObject {
    var parent: Router? { get set }
    
    func start()
}
