//
//  String+Extensions.swift
//  UI
//
//  Created by Ramon Haro Marques
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
