//
//  Presenter.swift
//  Presentation
//
//  Created by Ramon Haro Marques
//

import Foundation


public protocol Presenter {
    func viewDidLoad()
    func reload(silently: Bool)
}
