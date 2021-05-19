//
//  String+Extensions.swift
//  UI
//
//  Created by Ramon Haro Marques on 19/05/2021.
//

import Foundation

extension String {
    var localised: String {
        guard let bundle = Bundle(identifier: "com.reimondhill.UI") else {
            return self
        }
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
