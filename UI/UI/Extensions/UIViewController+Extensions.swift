//
//  UIViewController+Extensions.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public extension UIViewController {
    func showAlert(title: String,
                   message: String?,
                   buttonText: String,
                   completion: (()->Void)? = nil) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonText,
                                      style: .default,
                                      handler: { _ in
                                        completion?()
                                      }))
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
