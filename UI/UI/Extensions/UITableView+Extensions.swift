//
//  UITableView+Extensions.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView { }

public extension UITableView {
    func register<T: UITableViewHeaderFooterView>(header: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerEmptyCell() {
        register(UITableViewCell.self, forCellReuseIdentifier: "EmptyCell")
    }
    
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(for section: Int) -> T {
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header with identifier: \(T.reuseIdentifier)")
        }
        return header
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
