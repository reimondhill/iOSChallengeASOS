//
//  ListPresesnter.swift
//  Presentation
//
//  Created by Ramon Haro Marques
//

import Foundation

public protocol ListPresesnter: Presenter {
    func numberOfSections() -> Int
    
    func numberOfItems(section: Int) -> Int
    
    func headerTitle(section: Int) -> String?
    
    func canSelect(indexPath: IndexPath) -> Bool
    
    func didSeclect(indexPath: IndexPath)
}
