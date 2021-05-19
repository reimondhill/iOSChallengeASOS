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

protocol InfoGeneralRouterInterface: Router {}

class InfoGeneralRouter {
    //MARK: - Properties
    weak var context: UIViewController?
    weak var host: UIViewController?
    
    //MARK: - Constructor
    init(context: UIViewController?, host: UIViewController?) {
        self.context = context
        self.host = host
    }
}


//MARK: - InfoGeneralRouterInterface implementation
extension InfoGeneralRouter: InfoGeneralRouterInterface {
    var parent: Router? {
        get {
            nil
        }
        set {
            
        }
    }
    
    func start() {
        
    }
}


//MARK: -
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
