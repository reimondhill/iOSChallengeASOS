//
//  InfoGeneralRouter.swift
//  Info
//
//  Created by Ramon Haro Marques
//

import Foundation
import Routing
import UIKit
import SafariServices

protocol InfoGeneralRouterInterface: Router {
    func routeSelectorModule(options: [String], title: String, completion: @escaping (Int)->())
}

class InfoGeneralRouter: InfoGeneralRouterInterface {
    //MARK: - Properties
    weak var context: UIViewController?
    weak var host: UIViewController?
    
    //MARK: - Constructor
    init(context: UIViewController?, host: UIViewController?) {
        self.context = context
        self.host = host
    }
    
    
    //MARK: - InfoGeneralRouterInterface implementation
    weak var parent: Router?
    
    func start() {
        guard let context = context else {
            return
        }
        
        if let host = host as? UINavigationController {
            if host.viewControllers.count == 0 {
                host.setViewControllers([context], animated: true)
            } else {
                host.pushViewController(context, animated: true)
            }
        } else if host != nil {
            host?.present(context, animated: true, completion: nil)
        }
    }
    
    func routeSelectorModule(options: [String], title: String, completion: @escaping (Int)->()) {
        guard let context = context else {
            completion(-1)
            return
        }
        
        context.showSelectableAlert(options: options, title: title, cancelText: LocalisedStrings.cancel, completion: completion)
    }
}


//MARK: - ErrorRouter implementation
extension InfoGeneralRouter: ErrorRouter {
    func showError(title: String, message: String?) {
        context?.showAlert(title: title, message: message, buttonText: LocalisedStrings.ok)
    }
}


//MARK: - WebRouter implementation
extension InfoGeneralRouter: WebRouter {
    func route(url: URL, type: WebRouterType) {
        switch type {
        case .external:
            UIApplication.shared.open(url, options: [:], completionHandler: { [weak self] success in
                if !success {
                    self?.showError(title: LocalisedStrings.error, message: LocalisedStrings.errorUnableOpenURL)
                }
            })
        case .safariView:
            guard let context = context else {
                return
            }
            
            let safariViewController = SFSafariViewController(url: url)
            context.present(safariViewController, animated: true, completion: nil)
        }
    }
}
