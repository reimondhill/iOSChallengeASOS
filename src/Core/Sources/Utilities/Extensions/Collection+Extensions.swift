//
//  Collection+Extensions.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    /// - Parameters:
    ///   - index: The index of the item to get safely the element.
    /// - Returns: The element if available or nil otherwise.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[ index] : nil
    }
}

public extension Collection where Element: Hashable {
	/// Returns a new copy with non duplicate values.
    var unique: [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

public extension MutableCollection {
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    /// - Parameters:
    ///   - index: The index of the item to get safely the element.
    /// - Returns: The element if available or nil otherwise.
    subscript(safe index: Index) -> Element? {
        get {
            return indices.contains(index) ? self[ index] : nil
        }
        
        set(newValue) {
            if let newValue = newValue, indices.contains(index) {
                self[ index] = newValue
            }
        }
    }
}
