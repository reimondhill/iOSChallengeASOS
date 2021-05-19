//
//  LoaderDisplayable.swift
//  UI
//
//  Created by Ramon Haro Marques
//

import UIKit
import Presentation

import SnapKit

public protocol LoaderDisplayable: AnyObject {
    var loadingIndicator: UIActivityIndicatorView { get }
    func showLoadingIndicator(over view: UIView, isSofter: Bool)
    func dismissLoadingIndicator()
}

public extension LoaderDisplayable {
    func showLoadingIndicator(over view: UIView, isSofter: Bool = true){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            if self.loadingIndicator.superview == nil {
                view.addSubview(self.loadingIndicator)
                self.loadingIndicator.snp.makeConstraints { (maker) in
                    maker.size.centerX.centerY.equalToSuperview()
                }
            }
            view.bringSubviewToFront(self.loadingIndicator)
            self.loadingIndicator.isHidden = false
            //STYLE HERE!!!
            self.loadingIndicator.backgroundColor = isSofter ? UIColor.black.withAlphaComponent(0.45) : UIColor.black
            self.loadingIndicator.startAnimating()
        }
    }
    
    func dismissLoadingIndicator(){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.removeFromSuperview()
        }
    }
}


//MARK: - FetcherDisplayableContentDelegate extenion
public extension LoaderDisplayable where Self: (UIViewController & ProcessingDisplayable) {
    func processingDisplayable(isProcessing: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            if isProcessing {
                self.showLoadingIndicator(over: self.view, isSofter: true)
            }
            else {
                self.dismissLoadingIndicator()
            }
        }
    }
}
