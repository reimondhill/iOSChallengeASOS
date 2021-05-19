//
//  UITableView+Extensions.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

extension UITableViewCell: ReusableView {}

public extension UITableView {
    func registerEmptyCell() {
        register(UITableViewCell.self, forCellReuseIdentifier: "EmptyCell")
    }
    
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueEmptyCell(forIndexPath indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
