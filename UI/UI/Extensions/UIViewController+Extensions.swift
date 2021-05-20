//
//  UIViewController+Extensions.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit

public extension UIViewController {
    func showAlert(title: String, message: String?, buttonText: String, completion: (()->Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: buttonText, style: .default, handler: { _ in
                                        completion?()
                                      }))
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showSelectableAlert(options: [String], title: String, cancelText: String, completion: @escaping (Int)->Void) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
        for (index, value) in options.enumerated() {
            alertController.addAction(UIAlertAction(title: value, style: .default, handler: { [index] action in
                completion(index)
            }))
        }

        alertController.addAction(UIAlertAction(title: cancelText, style: .cancel, handler: { action in
            completion(-1)
        }))
        alertController.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
    }
}
