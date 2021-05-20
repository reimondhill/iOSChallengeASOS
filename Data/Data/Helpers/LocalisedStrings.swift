//
//  LocalisedStrings.swift
//  Data
//
//  Created by Ramon Haro Marques
//

import Foundation

struct LocalisedStrings {
    /// Returns a localised message for a generic unknown error
    static var errorUnknown: String {
        return "error_unknown".localised
    }
    
    /// Returns a localised message for a general network error
    static var networkError: String {
        return "network_error".localised
    }
    
    /// Returns a localised message for a network error invalid params
    static var networkErrorInvalidParams: String {
        return "network_error_invalid_params".localised
    }
    
    /// Returns a localised message for a network error invalid url
    static var networkErrorInvalidURL: String {
        return "network_error_invalid_url".localised
    }
    
    /// Returns a localised message for a network error data corrupted: 500, 404 ...
    static var networkErrorDataCorrupted: String {
        return "network_error_data_corrupted".localised
    }
}
