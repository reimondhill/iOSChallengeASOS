//
//  WebRouter.swift
//  Routing
//
//  Created by Ramon Haro Marques
//

import Foundation


public enum WebRouterType {
    case safariView
    case external
}

public protocol WebRouter {
    func route(url: URL, type: WebRouterType)
}
